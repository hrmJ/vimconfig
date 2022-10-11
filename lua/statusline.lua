require('lualine').setup({
  options = {
    globalstatus = true
  },
  sections = {
    lualine_z = {{'tabs', mode=1}},
    lualine_b = {''},
    lualine_c = {''},
    lualine_x = {''},
    lualine_y = {''},
    lualine_a = {'branch'}
  },
  inactive_winbar = {
      lualine_c = {{'filename', path=1}},
  },
  winbar = {
      lualine_a = {''},
      lualine_b = {{'filename', path=1}},
      lualine_c = {'diff', 'diagnostics'},
      lualine_y = {'' },
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_z = {'progress', 'location'}
  },
  --tabline = {
  --    lualine_z = {''},
  --    lualine_a = {''},
  --}
})
-- require('staline').setup {
--
--   sections = {
--     left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
--     mid = { 'file_name', 'lsp_name' },
--     right = { 'lsp', 'right_sep_double', '-line_column' },
--   },
-- }
