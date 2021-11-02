-- Key mappings that are not specific to any plugin

vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<leader>t', ':SymbolsOutline<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':Telescope  git_commits<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':Telescope  git_status<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':Telescope lsp_code_actions theme=cursor<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rr', ':Telescope lsp_references theme=cursor<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dd', ':Telescope lsp_implementations theme=cursor<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tl', ':Telescope<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', ':Telescope treesitter<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>s', ':Telescope grep_string<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope file_browser<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':Telescope current_buffer_fuzzy_find theme=dropdown<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>f', ':HopChar1 <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>l', ':HopPattern <CR>', { noremap = true, silent = true })
vim.cmd[[nnoremap <silent> <Leader>e <Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]]

vim.api.nvim_set_keymap('n', '<Leader><space>', ':Format <CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('i', ',,', '<c-o>a', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 't<C-n>', ':UltestLast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 't<C-n>', ':UltestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 't<C-f>', ':Ultest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 't<C-o>', ':UltestOutput<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '-', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

