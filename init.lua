require('plugins')
require('lsp.setup')
require('keys')
require('tree-sitter-setup')
require('cmp-config')


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
  let g:markdown_folding = 0

]]


vim.cmd('source ~/.config/nvim/keys.vim')

require('telescope').load_extension('fzf')
require('telescope').load_extension('heading')
require('nvim-autopairs').setup{}
require'nvim-web-devicons'.setup{}
require'nvim-tree'.setup {
  disable_netrw       = false,
  hijack_netrw        = false
}
-- require('gitsigns').setup {}
require('vgit').setup({
    keymaps = {
        ['n <C-k>'] = 'hunk_up',
        ['n <C-j>'] = 'hunk_down',
        ['n <leader>ga'] = 'actions',
        ['n <leader>gs'] = 'buffer_hunk_stage',
        ['n <leader>gr'] = 'buffer_hunk_reset',
        ['n <leader>gp'] = 'buffer_hunk_preview',
        ['n <leader>gb'] = 'buffer_blame_preview',
        ['n <leader>gf'] = 'buffer_diff_preview',
        ['n <leader>gh'] = 'buffer_history_preview',
        ['n <leader>gu'] = 'buffer_reset',
        ['n <leader>gg'] = 'buffer_gutter_blame_preview',
        ['n <leader>gd'] = 'project_diff_preview',
        ['n <leader>gq'] = 'project',
        ['n <leader>gx'] = 'toggle_diff_preference',
    }
})


vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = 'always',
    border = border
  },
})
