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
}
