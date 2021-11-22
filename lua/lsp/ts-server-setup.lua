local lspconfig = require("lspconfig")
local lspUtils = require('lsp.lsp-utils')

lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false        

        local ts_utils = require("nvim-lsp-ts-utils")

        ts_utils.setup({
            eslint_bin = "eslint_d",
            eslint_enable_diagnostics = true,
            eslint_enable_code_actions = true,
            enable_formatting = true,
            formatter = "prettierd",
        })

        ts_utils.setup_client(client)
        local utils = require('utils')

        utils.buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        utils.buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        utils.buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        lspUtils.on_attach(client, bufnr)

    end,
})



-- INSTALLS needed outside neovim
--
-- npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d @fsouza/prettierd