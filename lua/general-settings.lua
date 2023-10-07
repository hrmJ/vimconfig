vim.g.mapleader = ','
vim.o.termguicolors = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.hidden = true
vim.o.updatetime = 250

vim.cmd [[

  "let g:lightspeed_no_default_keymaps = 1
  set autoindent
  set expandtab
  set shiftwidth=2
  set smartindent
  set softtabstop=2
  set tabstop=2
  set nohlsearch
  set ignorecase

  au TermOpen * tnoremap <A-o> <c-\><c-n>

 "set winbar=%f
 "set showtabline=0

]]
