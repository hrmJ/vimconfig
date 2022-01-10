local lspUtils = require 'lsp.lsp-utils'

require('null-ls').setup {
  sources = {
    require('null-ls').builtins.formatting.prettierd,
    require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.completion.spell,
  },
  on_attach = lspUtils.on_attach
}
