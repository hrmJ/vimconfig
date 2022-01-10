local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use {'neovim/nvim-lspconfig'}

  use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
          require("null-ls").setup()
      end,
      requires = { "nvim-lua/plenary.nvim" },
  })

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

  if packer_bootstrap then
    require('packer').sync()
  end
end)
