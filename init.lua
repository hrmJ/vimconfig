local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require 'general-settings'
require('lazy').setup 'plugins'

require('luasnip').filetype_extend('typescript', { 'javascript' })
require('luasnip.loaders.from_vscode').load()

vim.cmd [[

let g:clipboard = {
  \   'name': 'WslClipboard',
  \   'copy': {
  \      '+': '/mnt/c/Windows/System32/clip.exe',
  \      '*': '/mnt/c/Windows/System32/clip.exe',
  \    },
  \   'paste': {
  \      '+': '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \      '*': '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \   },
  \   'cache_enabled': 0,
  \ }

]]

-- require 'plugins'
-- require 'autocommands'

--
-- local lspUtils = require 'lsp-utils'
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- require('null-ls').setup {
--   sources = {
--     require('null-ls').builtins.diagnostics.eslint_d,
--     require('null-ls').builtins.code_actions.eslint_d,
--     require('null-ls').builtins.formatting.prettierd,
--     require('null-ls').builtins.formatting.stylua,
--   },
--   on_attach = lspUtils.on_attach,
-- }
--
--
-- require("null-ls").setup({
--     -- you can reuse a shared lspconfig on_attach callback here
--     on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") then
--             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     vim.lsp.buf.format()
--                 end,
--             })
--         end
--     end,
-- })
--
--
--
