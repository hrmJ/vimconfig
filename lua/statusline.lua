require('lualine').setup({
  options = {
    globalstatus = true
  },
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
          {
            'filename',
            path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
          }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
-- require('staline').setup {
--
--   sections = {
--     left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
--     mid = { 'file_name', 'lsp_name' },
--     right = { 'lsp', 'right_sep_double', '-line_column' },
--   },
-- }
