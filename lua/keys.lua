local key = vim.api.nvim_set_keymap
local basicOpts = { noremap = true, silent = true }

vim.g.mapleader = ','
vim.cmd [[

  autocmd FileType markdown nnoremap <silent> <leader>tlh :Telescope heading<CR>

]]

key('n', '-', ':Explore<CR>', { noremap = true, silent = true })

key('n', '<c-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

key('n', '<leader>ca', ':Telescope lsp_code_actions theme=cursor<CR>', { noremap = true, silent = true })
key('n', '<leader>rr', ':Telescope lsp_references<CR>', { noremap = true, silent = true })
key('n', '<leader>tl', ':Telescope<CR>', { noremap = true, silent = true })
key('n', '<C-c>', ':bd<CR>', { noremap = true, silent = true })

--key('n', '<leader>dd', ':Telescope lsp_implementations theme=cursor<CR>', { noremap = true, silent = true })
--
key('n', '<leader>o', ':Telescope treesitter<CR>', { noremap = true, silent = true })

key('n', '<c-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })

key('n', '<leader>f', ':Telescope git_files<CR>', { noremap = true, silent = true })
-- key('n', '<leader>f', ':GFiles<CR>', { noremap = true, silent = true })

key('n', '<leader>g', ':Rg', { noremap = true, silent = true })
key('n', '<leader>G', ':Rg<CR>', { noremap = true, silent = true })

--key('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true })
key('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })

key(
  'n',
  '<leader>l',
  ":lua require('telescope.builtin').current_buffer_fuzzy_find({previewer=false, sorting_strategy = 'ascending'})<CR>",
  { noremap = true, silent = true }
)
--key('n', '<C-l>', ":BLines<CR>", { noremap = true, silent = true })
key('n', '<C-l>', ':Lines<CR>', { noremap = true, silent = true })

key('i', ',,', '<c-o>a', { noremap = true, silent = true })

-- key('n', '<C-l>', ":lua require('telescope.builtin').current_buffer_fuzzy_find({previewer=false, sorting_strategy = 'ascending'})<CR>", { noremap = true, silent = true })

-- key('n', '<leader>G', ':Rg<CR>', { noremap = true, silent = true })

-- key('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
-- key('i', '<C-l>', '<Esc>l:Telescope neoclip theme=cursor<CR>', { noremap = true, silent = true })
-- key('n', '<M-l><M-l>', ":lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>", { noremap = true, silent = true })
-- key('n', '<leader><leader>f', ':HopChar1 <CR>', { noremap = true, silent = true })
-- key('n', '<leader><leader>l', ':HopLine <CR>', { noremap = true, silent = true })
-- key('n', 's', ':HopPattern <CR>', { noremap = true, silent = true })
-- key('n', '<Leader><space>', ':Format <CR>', { noremap = true, silent = true })
-- key('i', ',,', '<c-o>a', { noremap = true, silent = true })
-- key('n', 't<C-l>', ':UltestLast<CR>', { noremap = true, silent = true })
-- key('n', 't<C-n>', ':UltestNearest<CR>', { noremap = true, silent = true })
-- key('n', 't<C-f>', ':Ultest<CR>', { noremap = true, silent = true })
-- key('n', 't<C-o>', ':UltestOutput<CR>', { noremap = true, silent = true })
-- key('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- key('n', '-', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
-- key('n', '<C-c>', ':bd<CR>', { noremap = true, silent = true })
-- key('v', '<leader>s', ':Telescope grep_string<CR>', { noremap = true, silent = true })
key('v', '<leader>w', ":lua require('telescope.builtin').grep_string({disable_coordinates=true, word_match = '-w'})<CR>", { noremap = true, silent = true })
vim.cmd [[nnoremap <silent> <Leader>e <Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]]
