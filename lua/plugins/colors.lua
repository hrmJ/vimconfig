return {

  { 'rktjmp/lush.nvim' },

  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.catppuccin_flavour = 'mocha' -- latte, frappe, macchiato, mocha
      require('catppuccin').setup()
      --vim.api.nvim_command 'colorscheme catppuccin'
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      --vim.api.nvim_command 'colorscheme gruvbox'
    end,
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_command 'colorscheme tokyonight'
    end,
  },
}
