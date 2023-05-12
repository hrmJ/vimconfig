local key = vim.api.nvim_set_keymap
key('n', '<c-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
key('n', '<leader>l', ":lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy = 'ascending'})<CR>", { noremap = true, silent = true })
key('n', '<leader>f', ':Telescope git_files<CR>', { noremap = true, silent = true })
key('n', '<leader>g', ':Telescope grep_string<CR>', { noremap = true, silent = true })
key('n', '<leader>tg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {noremap = true, silent = true})

key('n', '<leader>ts', ':Telescope git_status<CR>', { noremap = true, silent = true })
key('n', '<leader>G', ':Telescope grep_string search="" <CR>', { noremap = true, silent = true })
key('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
key('n', '<leader>tr', ':Telescope resume<CR>', { noremap = true, silent = true })
key('n', '<leader>tl', ':Telescope<CR>', { noremap = true, silent = true })
key('n', '-', ':Telescope file_browser 	sorting_strategy=ascending path=%:p:h grouped=true <CR><Esc>', { noremap = true, silent = true })
key('n', '<leader>q', ':Telescope quickfix <CR><Esc>', { noremap = true, silent = true })
key('n', '<leader>q', ':Telescope quickfix <CR><Esc>', { noremap = true, silent = true })
key('n', '<c-s>', ':Telescope luasnip<CR>', { noremap = true, silent = true })
key('i', '<c-s>', '<Esc>:Telescope luasnip<CR>', { noremap = true, silent = true })

function fuzzyFindFiles()
  require('telescope.builtin').grep_string {
    path_display = { 'smart' },
    only_sort_text = true,
    word_match = '-w',
    search = '',
  }
end

vim.keymap.set('n', '<C-g>', '<cmd>lua fuzzyFindFiles{}<cr>', {})

return {

  { 'nvim-lua/plenary.nvim' },
  { 'junegunn/fzf' },
  { 'junegunn/fzf.vim' },

  { 'nvim-telescope/telescope-symbols.nvim' },
  {
    'benfowler/telescope-luasnip.nvim',
    lazy = false,
    config = function()
      -- code
      require('telescope').load_extension 'luasnip'
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
    config = function()
      local telescope = require 'telescope'
      local actions = telescope.actions
      local fb_actions = telescope.extensions.file_browser.actions
      local lga_actions = require("telescope-live-grep-args.actions")

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


          live_grep_args = {
            auto_quoting = true,
            mappings = { -- extend mappings
              i = {
                ['<C-k>'] = lga_actions.quote_prompt(),
                ['<C-i>'] = lga_actions.quote_prompt { postfix = ' --iglob ' },
              },
            },
          },


        },
      }

      telescope.load_extension 'file_browser'
      telescope.load_extension 'fzf'
      telescope.load_extension 'luasnip'

      require('luasnip.loaders.from_vscode').load()
    end,
  },
}
