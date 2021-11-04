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
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<C-l>', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ":lua require('telescope.builtin').current_buffer_fuzzy_find({previewer=false, sorting_strategy = 'ascending'})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l><C-l>', ":Lines<CR>", { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<M-l><M-l>', ":lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>f', ':HopChar1 <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>l', ':HopLine <CR>', { noremap = true, silent = true })
vim.cmd[[nnoremap <silent> <Leader>e <Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]]

vim.api.nvim_set_keymap('n', '<Leader><space>', ':Format <CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('i', ',,', '<c-o>a', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 't<C-n>', ':UltestLast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 't<C-n>', ':UltestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 't<C-f>', ':Ultest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 't<C-o>', ':UltestOutput<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '-', ':e %:h<CR><CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-c>', ':bd<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('v', '<leader>s', ':Telescope grep_string<CR>', { noremap = true, silent = true })



vim.api.nvim_set_keymap('v', '<leader>w', ":lua require('telescope.builtin').grep_string({disable_coordinates=true, word_match = '-w'})<CR>", { noremap = true, silent = true })

--- LSP-specific mappings

local opts = {}
vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>di', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
