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
  use 'alec-gibson/nvim-tetris'

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
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
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

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end,
  }

  use 'lukas-reineke/cmp-rg'

  use 'petertriho/cmp-git'

  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = 'kyazdani41/nvim-web-devicons',
  -- }

  use {
    'quantumsnowball/telescope.nvim',
    branch = 'builtin-tabpages',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
  use { 'nvim-telescope/telescope-file-browser.nvim' }

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

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use 'nvim-lua/lsp-status.nvim'
  use 'tamton-aquib/staline.nvim'

  use 'RRethy/vim-illuminate'

  use { 'edluffy/specs.nvim' }

  use { 'tzachar/cmp-fuzzy-buffer', requires = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } }

  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })

  use 'napmn/react-extract.nvim'

  use 'iamcco/markdown-preview.nvim'

  use 'tkhren/vim-fake'

  use 'hoschi/yode-nvim'

  use 'ziontee113/syntax-tree-surfer'

  use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }

  use {
    "danymat/neogen",
    config = function()
        require('neogen').setup {}
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  }

  use 'ThePrimeagen/harpoon'

  use 'chentoast/marks.nvim'

  use "smjonas/inc-rename.nvim"

	use {'yuki-yano/fuzzy-motion.vim', requires = 'vim-denops/denops.vim'}

  use {
    "rcarriga/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }

  use 'koenverburg/peepsight.nvim'

  -- use 'ggvgc/vim-fuzzysearch'

  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }


  if packer_bootstrap then
    require('packer').sync()
  end
end)
