return function(use) 


	use {
	  'nvim-telescope/telescope.nvim', 
	  tag = '0.1.0',
	  as = 'telescope',
	  requires = { {'nvim-lua/plenary.nvim'} },
	  config = function()

		local actions = require "telescope.actions"
		require("telescope").setup {
		  pickers = {
		    buffers = {
		      sort_lastused = true,
		      mappings = {
			i = {
			  ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
			}
		      }
		    }
		  },
		  defaults = {
		    mappings = {
		      n = {
			  ["<esc>"] = false,
			  ["<C-c>"] = actions.close,
		      },
		      i = {
			  ["<esc>"] = false,
		      },
		    },
		  },
		  extensions = {
		  },
		}

	  end
	}



end
