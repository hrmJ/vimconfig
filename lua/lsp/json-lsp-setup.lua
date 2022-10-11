local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
	cmd = { "vscode-json-languageserver", "--stdio" }
}
-- note: install https://www.npmjs.com/package/vscode-json-languageserver directly
