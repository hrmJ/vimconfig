local lspconfig = require 'lspconfig'
local lspUtils = require 'lsp.lsp-utils'

require('null-ls').config {
  sources = {
    require('null-ls').builtins.formatting.prettierd,
    require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.completion.spell,
  },
}

lspconfig['null-ls'].setup { on_attach = lspUtils.on_attach }

-- https://github.com/JohnnyMorganz/StyLua/releases
