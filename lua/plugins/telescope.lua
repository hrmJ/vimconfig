local key = vim.api.nvim_set_keymap
key('n', '<c-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
key('n', '<leader>l', ":lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy = 'ascending'})<CR>", { noremap = true, silent = true })
key('n', '<leader>f', ':Telescope git_files<CR>', { noremap = true, silent = true })
key('n', '<leader>G', ':Telescope grep_string search="" <CR>', { noremap = true, silent = true })
key('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
key('n', '<leader>tr', ':Telescope resume<CR>', { noremap = true, silent = true })

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
