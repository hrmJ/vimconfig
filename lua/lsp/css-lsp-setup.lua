local lspconfig = require 'lspconfig'
local lspUtils = require 'lsp.lsp-utils'

--Enable completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
  on_attach = lspUtils.on_attach,
  capabilities = capabilities,
}

-- npm i -g vscode-langservers-extracted
