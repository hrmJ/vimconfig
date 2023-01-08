return {

  { 'nvim-treesitter/nvim-treesitter-textobjects' },

  { 'windwp/nvim-ts-autotag' },

  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        tree_docs = {
          enable = true,
          keymaps = {
            doc_node_at_cursor = 'gjd',
            doc_all_in_range = 'gjd',
          },
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        folding = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
          textobjects = {
            move = {
              enable = true,
              set_jumps = true, -- whether to set jumps in the jumplist
              goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
              },
              goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
              },
              goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
              },
              goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
              },
            },
          },
        },
      }
    end,
  },
}
