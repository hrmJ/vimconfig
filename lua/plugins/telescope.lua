local key = vim.api.nvim_set_keymap
key('n', '<c-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
key('n', '<leader>l', ":lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy = 'ascending'})<CR>", { noremap = true, silent = true })
key('n', '<leader>f', ':Telescope git_files<CR>', { noremap = true, silent = true })
key('n', '<leader>g', ':Telescope grep_string<CR>', { noremap = true, silent = true })
key('n', '<leader>G', ':Telescope grep_string search="" disable_coordinates=true only_show_text=true <CR>', { noremap = true, silent = true })
key('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
key('n', '<leader>tr', ':Telescope resume<CR>', { noremap = true, silent = true })
key('n', '<leader>tl', ':Telescope<CR>', { noremap = true, silent = true })
key('n', '-', ':Telescope file_browser 	sorting_strategy=ascending path=%:p:h grouped=true <CR><Esc>', { noremap = true, silent = true })

key('n', '<leader>G', ':Telescope grep_string search="" <CR>', { noremap = true, silent = true })

return {

  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
    },
    config = function()
      local telescope = require 'telescope'
      local actions = telescope.actions
      local fb_actions = telescope.extensions.file_browser.actions
      telescope.setup {
        pickers = {
          buffers = {
            sort_lastused = true,
            mappings = {
              i = {
                ['<c-d>'] = require('telescope.actions').delete_buffer + require('telescope.actions').move_to_top,
              },
            },
          },
        },
        defaults = {
          mappings = {
            n = {
              ['<esc>'] = false,
              ['<C-c>'] = require('telescope.actions').close,
            },
            i = {
              ['<esc>'] = false,
            },
          },
        },
        extensions = {

          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          },

          file_browser = {
            layout_config = {
              vertical = { width = 0.8 },
              -- other layout configuration here
            },
            hijack_netrw = true,
            mappings = {
              i = {
                ['<C-o>'] = fb_actions.create_from_prompt,
              },
              n = {
                ['<C-j>'] = fb_actions.goto_home_dir,
              },
            },
          },
        },
      }

      telescope.load_extension 'file_browser'
      telescope.load_extension 'fzf'
    end,
  },
}
