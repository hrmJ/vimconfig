local lspconfig = require 'lspconfig'
local lspUtils = require 'lsp.lsp-utils'
lspconfig.sumneko_lua.setup {
  cmd = { 'lua-language-server' },
}
