local lspUtils = require 'lsp.lsp-utils'

require('null-ls').setup {
  sources = {
    require('null-ls').builtins.diagnostics.eslint_d,
    require('null-ls').builtins.code_actions.eslint_d,
    require('null-ls').builtins.formatting.prettierd,
    require('null-ls').builtins.formatting.stylua,
  },
  on_attach = lspUtils.on_attach,
}


local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format()
                end,
            })
        end
    end,
})
