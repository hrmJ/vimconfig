return {

  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {}
    end,
  },

  {
    'nyngwang/NeoTerm.lua',
    config = function()
      require('neo-term').setup {
        exclude_filetypes = { 'oil' },
        exclude_buftypes = { 'terminal' },
      }
      vim.keymap.set('n', '<leader>t', function()
        vim.cmd 'NeoTermToggle'
      end)
      vim.keymap.set('t', '<M-o>', function()
        vim.cmd 'NeoTermEnterNormal'
      end)
    end,
  },
}
