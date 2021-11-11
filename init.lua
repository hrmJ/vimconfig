local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-surround'
  use 'Raimondi/delimitMate'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  use {'tomasiser/vim-code-dark'}
  use {'EdenEast/nightfox.nvim'}
  use {'sainnhe/sonokai'}

  use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use {'junegunn/fzf.vim'}
  use 'tpope/vim-eunuch'


  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp' 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'junegunn/vim-easy-align'


  use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kyazdani42/nvim-web-devicons'
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {
        disable_netrw       = false,
        hijack_netrw        = false,
      } end
  }

  use {
    'phaazon/hop.nvim',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }


  use 'andys8/vscode-jest-snippets'
  use {"ellisonleao/glow.nvim"}

--  use {'neoclide/coc.nvim', branch='release'}
--
  use 'vim-voom/VOoM'


end)


local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

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
]]


require('hop').setup()
require('keys')
require('telescope-config')
-- require('linters-config')
require('treesitter-conf')
-- require('navigator-config')
require('lsp-config')
require('cmp-config')
require'nvim-web-devicons'.setup()
vim.cmd('source ~/.config/nvim/vim/vimkeys.vim')

vim.cmd [[

  let g:ultest_use_pty = 1
  let test#javascript#reactscripts#options = "--watchAll=false"
  colorscheme sonokai
  let g:markdown_folding = 1

]]


vim.cmd('source ~/.config/nvim/keys.vim')

-- use omnifunc
-- vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- vim.opt.completeopt = {'noinsert', 'menuone', 'noselect'}


-- vim.cmd [[ autocmd VimEnter * COQnow --shut-up ]]

-- vim.cmd [[ 
-- let g:coq_settings = { 'keymap.jump_to_mark': '<c-j>' }
-- 
-- ]]
