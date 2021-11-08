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
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use {'junegunn/fzf.vim'}
  use 'tpope/vim-eunuch'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kyazdani42/nvim-web-devicons'
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {
        disable_netrw       = false,
        hijack_netrw        = false,
      } end
  }


end)



local lsp_installer_servers = require'nvim-lsp-installer.servers'

local servers = {'tsserver'}

for _, lsp in ipairs(servers) do
  local server_available, requested_server = lsp_installer_servers.get_server(lsp)
  if server_available then
      requested_server:on_ready(function ()
          requested_server:setup{
            on_attach = function()
              local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
              local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
              -- Enable completion triggered by <c-x><c-o>
              buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
            end
            }
      end)
      if not requested_server:is_installed() then
          -- Queue the server to be installed
          requested_server:install()
      end
  end
end



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
require'nvim-web-devicons'.setup()
vim.cmd('source ~/.config/nvim/vim/vimkeys.vim')

