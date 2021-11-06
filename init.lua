local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-surround'
  use 'Raimondi/delimitMate'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  use {'tomasiser/vim-code-dark', config ='vim.cmd[[colorscheme codedark]]'}
  use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'ms-jpq/coq_nvim', branch= 'coq', run=':COQdeps'}
  use {'ms-jpq/coq.thirdparty', branch= '3p'}
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use {'junegunn/fzf.vim'}
  use 'tpope/vim-eunuch'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kyazdani42/nvim-web-devicons'


end)


local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

require("null-ls").config {}
require("lspconfig")["null-ls"].setup {}
require'navigator'.setup({
   icons = {
      diagnostic_err = "",
      diagnostic_warn = " ",
      diagnostic_hint = " "
   },
   lsp = {
     code_action = {enable = true, sign = false, sign_priority = 40, virtual_text = false},
     format_on_save = false,
     diagnostic_virtual_text = false,
     tsserver = {
         -- filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact"},
         on_attach = function(client, bufnr)
             local ts_utils = require("nvim-lsp-ts-utils")
             ts_utils.setup {
                 debug = false,
                 disable_commands = false,
                 enable_import_on_completion = false,
                 import_on_completion_timeout = 5000,
                 -- eslint
                 eslint_enable_code_actions = false,
                 eslint_bin = "eslint_d",
                 -- eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
                 eslint_enable_disable_comments = true,
                 -- eslint diagnostics
                 eslint_enable_diagnostics = false,
                 eslint_diagnostics_debounce = 250,
                 -- formatting
                 enable_formatting = true,
                 formatter = "prettierd",
                 formatter_args = {"--stdin-filepath", "$FILENAME"},
                 format_on_save = true,
                 no_save_after_format = false,
                 -- parentheses completion
                 complete_parens = false,
                 signature_help_in_parens = true,
                 -- update imports on file move
                 update_imports_on_move = true,
                 require_confirmation_on_move = false,
             }
             client.resolved_capabilities.document_formatting = false
             -- define an alias
             vim.cmd("command -buffer Formatting lua vim.lsp.buf.formatting()")
             vim.cmd("command -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
             -- format on save
             vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
             ts_utils.setup_client(client)
         end
    }
   }
 }
)

vim.o.termguicolors = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.hidden = true

vim.cmd [[
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
set nohlsearch
]]



require('keys')
require('telescope-config')
require('linters-config')
require'nvim-web-devicons'.setup()
vim.cmd('source ~/.config/nvim/vim/vimkeys.vim')
