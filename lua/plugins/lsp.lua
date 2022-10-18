
return function(use) 

	use {
	  'neovim/nvim-lspconfig', 
	  as = 'lspconfig',
	  config = function()
      require'lspconfig'.tsserver.setup{}
	  end
	}


end
