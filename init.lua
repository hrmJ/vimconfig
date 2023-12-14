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

-- vim.cmd [[
--
-- let g:clipboard = {
--   \   'name': 'WslClipboard',
--   \   'copy': {
--   \      '+': '/mnt/c/Windows/System32/clip.exe',
--   \      '*': '/mnt/c/Windows/System32/clip.exe',
--   \    },
--   \   'paste': {
--   \      '+': '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   \      '*': '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   \   },
--   \   'cache_enabled': 0,
--   \ }
--
-- ]]
