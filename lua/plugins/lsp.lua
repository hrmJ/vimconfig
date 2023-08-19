local utils = require 'utils'
local key = vim.api.nvim_set_keymap

vim.cmd [[nnoremap <silent> <Leader>e <Cmd>lua vim.diagnostic.open_float()<CR>]]
vim.cmd [[nnoremap <silent> <Leader>gd <Cmd>TypescriptGoToSourceDefinition<CR>]]
key('n', '<leader>rr', ':Telescope lsp_references fname_width=90<CR>', { noremap = true, silent = true })
key('n', '<leader>ca', ':LspCodeAction<CR>', { noremap = true, silent = true })

vim.diagnostic.config {
  virtual_text = false,
  signs = false,
  underline = true,
  float = {
    border = 'single',
    format = function(diagnostic)
      return string.format('%s (%s) [%s]', diagnostic.message, diagnostic.source, diagnostic.code or diagnostic.user_data.lsp.code)
    end,
  },
}

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  if require('lspconfig').util.root_pattern('deno.json', 'deno.jsonc')(vim.fn.getcwd()) then
    if client.name == 'tsserver' then
      client.stop()
      return
    end
  end

  vim.cmd 'command! LspDef lua vim.lsp.buf.definition()'
  vim.cmd 'command! LspFormatting lua vim.lsp.buf.format()'
  vim.cmd 'command! LspCodeAction lua vim.lsp.buf.code_action()'
  vim.cmd 'command! LspHover lua vim.lsp.buf.hover()'
  vim.cmd 'command! LspRename lua vim.lsp.buf.rename()'
  vim.cmd 'command! LspRefs lua vim.lsp.buf.references()'
  vim.cmd 'command! LspTypeDef lua vim.lsp.buf.type_definition()'
  vim.cmd 'command! LspImplementation lua vim.lsp.buf.implementation()'
  vim.cmd 'command! LspDiagPrev lua vim.diagnostic.goto_prev()'
  vim.cmd 'command! LspDiagNext lua vim.diagnostic.goto_next()'
  vim.cmd 'command! LspSignatureHelp lua vim.lsp.buf.signature_help()'

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  utils.buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
  utils.buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
  utils.buf_map(bufnr, 'n', 'gy', ':LspTypeDef<CR>')
  utils.buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
  utils.buf_map(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
  utils.buf_map(bufnr, 'n', ']a', ':LspDiagNext<CR>')
  utils.buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
  utils.buf_map(bufnr, 'i', '<C-x><C-x>', '<cmd> LspSignatureHelp<CR>')
end

return {

  'b0o/SchemaStore.nvim',

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup {
        hint_prefix = '',
      }
    end,
  },

  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup {}
    end,
  },

  {
    'neovim/nvim-lspconfig',
    ---@type lspconfig.options
    servers = {
      tsserver = {},
      jsonls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
        end,
        settings = {
          json = {
            format = {
              enable = true,
            },
            validate = { enable = true },
          },
        },
      },
      yamlls = {
        schemas = {
          ['https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json'] = '/*.openapi.yaml',
          ['https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json'] = '/*.k8s.yaml',
          ['https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/kustomization.json'] = '/*.kustomization.yaml',
          ..., -- other schemas
        },
      },
      marksman = {},
      robotframework_ls = {},
    },
    config = function()
      local util = require('lspconfig').util
      require('lspconfig').marksman.setup {}
      require('lspconfig').robotframework_ls.setup {}
      require('lspconfig').yamlls.setup {}
      require('lspconfig').jsonls.setup {}
      require('lspconfig').tsserver.setup {
        on_attach = on_attach,
        root_dir = util.root_pattern 'package.json',
        single_file_support = false,
      }
      require('lspconfig').denols.setup {
        on_attach = on_attach,
        root_dir = util.root_pattern('deno.json', 'deno.jsonc'),

        init_options = {
          lint = true,
          unstable = true,
          suggest = {
            imports = {
              hosts = {
                ['https://deno.land'] = true,
                ['https://cdn.nest.land'] = true,
                ['https://crux.land'] = true,
              },
            },
          },
        },
      }
      vim.g.markdown_fenced_languages = {
        'ts=typescript',
      }
    end,
  },
  { 'mfukar/robotframework-vim' },

  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local nls = require 'null-ls'
      nls.setup {
        debounce = 150,
        save_after_format = false,
        sources = {
          nls.builtins.formatting.prettier,
          -- nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.eslint_d,
          nls.builtins.diagnostics.eslint_d,
          nls.builtins.code_actions.eslint_d,
        },
        on_attach = function(client, bufnr)
          require('lsp-format').on_attach(client, bufnr)
        end,
      }
    end,
  },

  {
    'lukas-reineke/lsp-format.nvim',
    config = function()
      require('lsp-format').setup {}
    end,
  },

  {
    'jose-elias-alvarez/typescript.nvim',
    config = function()
      require('typescript').setup {
        disable_commands = false,
        debug = false,
        go_to_source_definition = {
          fallback = true, -- fall back to standard LSP definition on failure
        },
        server = { -- pass options to lspconfig's setup method
          on_attach = function(client, bufnr)
            local util = require('lspconfig').util
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false
            root_dir = util.root_pattern 'package.json'
            single_file_support = false
            on_attach(client, bufnr)
          end,
        },
      }
    end,
  },
}
