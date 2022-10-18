local plugins = require('packer-config')
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
    function(use)
	use 'wbthomason/packer.nvim'
        plugins.config(use)

        if packer_bootstrap then require('packer').sync() end
    end,
})
