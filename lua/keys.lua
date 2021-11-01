-- Key mappings that are not specific to any plugin

vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>s', ':Telescope grep_string<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope file_browser<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>f', ':HopChar1 <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>l', ':HopPattern <CR>', { noremap = true, silent = true })
vim.cmd[[nnoremap <silent> <Leader>e <Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]]
