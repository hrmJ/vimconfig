local key = vim.api.nvim_set_keymap

key('n', 's', ':Pounce<CR>', { noremap = true, silent = true })

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
}
