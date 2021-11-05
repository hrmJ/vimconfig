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
	use 'neovim/nvim-lspconfig'
	use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use {'ms-jpq/coq_nvim', branch= 'coq', run=':COQdeps'}
	use {'ms-jpq/coq.thirdparty', branch= '3p'}
end)


require'navigator'.setup()
