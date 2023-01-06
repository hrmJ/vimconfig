local key = vim.api.nvim_set_keymap

key('n', 's', ':Pounce<CR>', { noremap = true, silent = true })

return {
  {
    'rlane/pounce.nvim',
    config = function()
      require('pounce').setup {}
    end,
  },
}
