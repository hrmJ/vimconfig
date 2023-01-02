local utils = require 'utils'

return {

  "b0o/SchemaStore.nvim",


  {
    "neovim/nvim-lspconfig",
    ---@type lspconfig.options
    servers = {
      tsserver = {},
      jsonls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
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
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local nls = require("null-ls")
      nls.setup({
        debounce = 150,
        save_after_format = false,
        sources = {
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.eslint_d,
          nls.builtins.diagnostics.eslint_d,
        },
        on_attach = require("lsp-format").on_attach
      })
    end,
  },
  
  {
    "lukas-reineke/lsp-format.nvim",
    config = function()
      require("lsp-format").setup {}
    end
  }


}

