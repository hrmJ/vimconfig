local utils = require 'utils'
local key = vim.api.nvim_set_keymap

vim.cmd [[nnoremap <silent> <Leader>e <Cmd>lua vim.diagnostic.open_float()<CR>]]
key('n', '<leader>ca', ':LspCodeAction<CR>', { noremap = true, silent = true })

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  vim.cmd 'command! LspDef lua vim.lsp.buf.definition()'
  vim.cmd 'command! LspFormatting lua vim.lsp.buf.format()'
  vim.cmd 'command! LspCodeAction lua vim.lsp.buf.code_action()'
  vim.cmd 'command! LspHover lua vim.lsp.buf.hover()'
  vim.cmd 'command! LspRename lua vim.lsp.buf.rename()'
  vim.cmd 'command! LspRefs lua vim.lsp.buf.references()'
  vim.cmd 'command! LspTypeDef lua vim.lsp.buf.type_definition()'
  vim.cmd 'command! LspImplementation lua vim.lsp.buf.implementation()'
  vim.cmd 'command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()'
  vim.cmd 'command! LspDiagNext lua vim.lsp.diagnostic.goto_next()'
  vim.cmd 'command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()'
  vim.cmd 'command! LspSignatureHelp lua vim.lsp.buf.signature_help()'

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  utils.buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
  utils.buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
  utils.buf_map(bufnr, 'n', 'gy', ':LspTypeDef<CR>')
  utils.buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
  utils.buf_map(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
  utils.buf_map(bufnr, 'n', ']a', ':LspDiagNext<CR>')
  utils.buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
  utils.buf_map(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')
  utils.buf_map(bufnr, 'i', '<C-x><C-x>', '<cmd> LspSignatureHelp<CR>')
end

return {

  'b0o/SchemaStore.nvim',

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
      yamlls = {},
    },
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local nls = require 'null-ls'
      nls.setup {
        debounce = 150,
        save_after_format = false,
        sources = {
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.eslint_d,
          nls.builtins.diagnostics.eslint_d,
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
          on_attach = on_attach,
        },
      }
    end,
  },
}
