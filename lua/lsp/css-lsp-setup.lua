local lspconfig = require 'lspconfig'
local lspUtils = require 'lsp.lsp-utils'

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.cssls.setup {
  on_attach = lspUtils.on_attach,
  capabilities = capabilities,
}

-- npm i -g vscode-langservers-extracted
