local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use { 'neovim/nvim-lspconfig' }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('null-ls').setup()
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'tpope/vim-vinegar'

  use { 'akinsho/toggleterm.nvim' }

  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'Raimondi/delimitMate'
  use 'tpope/vim-eunuch'
  use 'Olical/vim-enmasse'
  use 'idanarye/vim-merginal'
  use 'preservim/nerdtree'

  --use 'SidOfc/mkdx'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use { 'junegunn/fzf.vim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { 'tomasiser/vim-code-dark' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'sainnhe/sonokai' }
  use 'marko-cerovac/material.nvim'
  use 'folke/lsp-colors.nvim'
  use 'chrisbra/Colorizer'
  use 'rebelot/kanagawa.nvim'
  use {
    'mcchrish/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = 'rktjmp/lush.nvim',
  }

  use 'ms-jpq/coq_nvim'


  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons'
  use { 'rcarriga/vim-ultest', requires = { 'vim-test/vim-test' }, run = ':UpdateRemotePlugins' }
  use {
    'ray-x/lsp_signature.nvim',
  }

  use 'andys8/vscode-jest-snippets'

  use 'ggandor/lightspeed.nvim'
  use 'tpope/vim-repeat'
  use 'fladson/vim-kitty'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }

  use { 'nvim-treesitter/nvim-tree-docs', requires = { 'nvim-treesitter/nvim-treesitter' } }

  -- use {
  --   'folke/trouble.nvim',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = function()
  --     require('trouble').setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end,
  -- }

  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = 'kyazdani42/nvim-web-devicons',
  -- }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use 'crispgm/telescope-heading.nvim'
  use { 'tknightz/telescope-termfinder.nvim' }

  use 'windwp/nvim-ts-autotag'

  use {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup {}
      require('pretty-fold.preview').setup()
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
