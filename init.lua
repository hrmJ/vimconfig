
--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = 'nosplit'
vim.o.hidden = true
vim.o.breakindent = true
vim.opt.undofile = true
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

require('plugins')
require('git-config')
require('tree-sitter-conf')
require('lsp-conf')
require('cmp-conf')
require('colors')


