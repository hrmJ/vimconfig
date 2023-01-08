return {

  { 'rktjmp/lush.nvim' },

  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.catppuccin_flavour = 'mocha' -- latte, frappe, macchiato, mocha
      require('catppuccin').setup()
      vim.api.nvim_command 'colorscheme catppuccin'

      vim.cmd 'hi! link DiagnosticHint String'
      vim.cmd 'hi DiagnosticUnderlineError gui=undercurl'
      vim.cmd 'hi DiagnosticUnderlineWarn  gui=undercurl'
      vim.cmd 'hi DiagnosticUnderlineInfo  gui=undercurl'
      vim.cmd 'hi DiagnosticUnderlineHint  gui=undercurl'
    end,
  },

  {

    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup {
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true, -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        globalStatus = false, -- adjust window separators highlight for laststatus=3
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {},
        overrides = {},
        theme = 'default', -- Load "default" theme or the experimental "light" theme
      }
      -- vim.api.nvim_command 'colorscheme kanagawa',
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
      --vim.api.nvim_command 'colorscheme tokyonight'
    end,
  },
}
