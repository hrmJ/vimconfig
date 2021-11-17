local lspconfig = require("lspconfig")
local lspUtils = require('lsp.lsp-utils')


require("null-ls").config({})
lspconfig["null-ls"].setup({ on_attach = lspUtils.on_attach })

