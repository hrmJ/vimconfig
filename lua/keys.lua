local key = vim.api.nvim_set_keymap
local basicOpts = { noremap = true, silent = true }

vim.g.mapleader = ','
vim.cmd [[

  autocmd FileType markdown nnoremap <silent> <leader>tlh :Telescope heading<CR>

]]

key('n', '<leader><c-t>', ":lua require('toggleterm.terminal').Terminal:new():toggle()<CR>", { noremap = true, silent = true })
key('n', '<leader>tt', ':Telescope termfinder<CR>', { noremap = true, silent = true })

key('n', '-', ':Telescope file_browser 	sorting_strategy=ascending path=%:p:h grouped=true <CR><Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>fb', ':Telescope file_browser', { noremap = true })

key('n', '<c-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

key('n', '<leader>gh', ':0Gclog<CR>', { noremap = true, silent = true })

key('n', '<leader>ca', ':Telescope lsp_code_actions theme=cursor<CR>', { noremap = true, silent = true })
key('n', '<leader>rr', ':Telescope lsp_references<CR>', { noremap = true, silent = true })
key('n', '<leader>tl', ':Telescope<CR>', { noremap = true, silent = true })
key('n', '<C-c>', ':bd<CR>', { noremap = true, silent = true })

--
key('n', '<leader>o', ':Telescope lsp_document_symbols<CR>', { noremap = true, silent = true })

key('n', '<c-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })

key('n', '<leader>r', ':Telescope git_branches<CR>', { noremap = true, silent = true })
key('n', '<leader>f', ':Telescope git_files<CR>', { noremap = true, silent = true })

key('n', '<leader>G', ':Telescope grep_string search="" <CR>', { noremap = true, silent = true })
key('n', '<leader><C-G>', ':Rg<CR>', { noremap = true, silent = true })

key('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
key('n', '<leader>tr', ':Telescope resume<CR>', { noremap = true, silent = true })

key('n', '<space>', '/', { noremap = true, silent = true })

key('n', '<leader>l', ":lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy = 'ascending'})<CR>", { noremap = true, silent = true })
key('n', '<C-l>', ':Lines<CR>', { noremap = true, silent = true })

key('i', ',,', '<c-o>a', { noremap = true, silent = true })

key('n', 't<C-l>', ':UltestLast<CR>', { noremap = true, silent = true })
key('n', 't<C-n>', ':UltestNearest<CR>', { noremap = true, silent = true })
key('n', 't<C-f>', ':Ultest<CR>', { noremap = true, silent = true })
key('n', 't<C-o>', ':UltestOutput<CR>', { noremap = true, silent = true })
key('v', '<leader>s', ':Telescope grep_string<CR>', { noremap = true, silent = true })
key('v', '<leader>w', ":lua require('telescope.builtin').grep_string({disable_coordinates=true, word_match = '-w'})<CR>", { noremap = true, silent = true })
vim.cmd [[nnoremap <silent> <Leader>e <Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]]
