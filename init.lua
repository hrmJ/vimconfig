require('plugins')
require('lsp.setup')
require('keys')
require('tree-sitter-setup')


vim.o.termguicolors = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.hidden = true
vim.o.updatetime = 250

vim.cmd [[

  set autoindent
  set expandtab
  set shiftwidth=2
  set smartindent
  set softtabstop=2
  set tabstop=2
  set nohlsearch

  let g:ultest_use_pty = 1
  let test#javascript#reactscripts#options = "--watchAll=false"
  colorscheme sonokai
  let g:markdown_folding = 1

]]


vim.cmd('source ~/.config/nvim/keys.vim')
