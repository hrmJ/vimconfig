local key = vim.api.nvim_set_keymap

key('n', 's', ':Pounce<CR>', { noremap = true, silent = true })
key('i', ',,', '<c-o>a', { noremap = true, silent = true })

vim.filetype.add {
  pattern = {
    ['Tiltfile'] = 'python',
    ['Jenkinsfile'] = 'groovy',
  },
}

return {

  {
    'itchyny/calendar.vim',
  },

  {
    'ds1sqe/Calendar.nvim',
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  {
    'rlane/pounce.nvim',
    config = function()
      require('pounce').setup {}
    end,
  },

  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  {

    'chentoast/marks.nvim',
    config = function()
      require('marks').setup()
    end,
  },

  { 'Olical/vim-enmasse' },

  { 'tpope/vim-eunuch' },

  {
    'echasnovski/mini.align',
    config = function()
      require('mini.align').setup()
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  {
    'tversteeg/registers.nvim',
    cmd = 'Registers',
    config = true,
    keys = {
      { '"', mode = { 'n', 'v' } },
      { '<C-R>', mode = 'i' },
    },
    name = 'registers',
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
}
