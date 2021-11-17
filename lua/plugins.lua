local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use "nvim-lua/plenary.nvim"
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"

  use 'tpope/vim-fugitive' 
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'Raimondi/delimitMate'
  use 'tpope/vim-eunuch'

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use {'junegunn/fzf.vim'}

  use {'tomasiser/vim-code-dark'}
  use {'EdenEast/nightfox.nvim'}
  use {'sainnhe/sonokai'}


 if packer_bootstrap then
    require('packer').sync()
  end


end)



