local lspconfig = require("lspconfig")
local lspUtils = require('lsp.lsp-utils')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig["cssls"].setup({ on_attach = lspUtils.on_attach })


-- npm i -g vscode-langservers-extracted
