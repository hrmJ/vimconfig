return {

  {

    'ziontee113/syntax-tree-surfer',

    config = function()
      -- Syntax Tree Surfer

      -- Normal Mode Swapping
      vim.api.nvim_set_keymap('n', 'vd', '<cmd>lua require("syntax-tree-surfer").move("n", false)<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'vu', '<cmd>lua require("syntax-tree-surfer").move("n", true)<cr>', { noremap = true, silent = true })
      -- .select() will show you what you will be swapping with .move(), you'll get used to .select() and .move() behavior quite soon!
      vim.api.nvim_set_keymap('n', 'vx', '<cmd>lua require("syntax-tree-surfer").select()<cr>', { noremap = true, silent = true })
      -- .select_current_node() will select the current node at your cursor
      vim.api.nvim_set_keymap('n', 'vn', '<cmd>lua require("syntax-tree-surfer").select_current_node()<cr>', { noremap = true, silent = true })

      -- NAVIGATION: Only change the keymap to your liking. I would not recommend changing anything about the .surf() parameters!
      vim.api.nvim_set_keymap('x', 'J', '<cmd>lua require("syntax-tree-surfer").surf("next", "visual")<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('x', 'K', '<cmd>lua require("syntax-tree-surfer").surf("prev", "visual")<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('x', 'H', '<cmd>lua require("syntax-tree-surfer").surf("parent", "visual")<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('x', 'L', '<cmd>lua require("syntax-tree-surfer").surf("child", "visual")<cr>', { noremap = true, silent = true })

      -- SWAPPING WITH VISUAL SELECTION: Only change the keymap to your liking. Don't change the .surf() parameters!
      vim.api.nvim_set_keymap('x', '<C-j>', '<cmd>lua require("syntax-tree-surfer").surf("next", "visual", true)<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('x', '<C-k>', '<cmd>lua require("syntax-tree-surfer").surf("prev", "visual", true)<cr>', { noremap = true, silent = true })

      -- Syntax Tree Surfer V2 Mappings
      -- Targeted Jump with virtual_text
      --
      local stf = require 'syntax-tree-surfer'

      vim.keymap.set('n', '<leader>sa', function() -- jump to all that you specify
        stf.targeted_jump {
          'property_identifier',
          'return_statement',
          'variable_declarator',
          'function',
          'if_statement',
          'else_statement',
        }
      end, opts)

      vim.keymap.set('n', '<leader>sp', function() -- jump to all that you specify
        stf.targeted_jump {
          'formal_parameters',
          'property_identifier',
        }
      end, opts)

      vim.keymap.set('n', '<leader>sf', function() -- jump to all that you specify
        stf.targeted_jump {
          'arrow_function',
          'function',
        }
      end, opts)

      vim.keymap.set('n', '<leader>sc', function() -- jump to all that you specify
        stf.targeted_jump {
          'call_expression',
        }
      end, opts)

      vim.keymap.set('n', '<leader>sv', function() -- jump to all that you specify
        stf.targeted_jump {
          'variable_declarator',
        }
      end, opts)

      vim.keymap.set('n', '<leader>si', function() -- jump to all that you specify
        stf.targeted_jump {
          'if_statement',
          'else_statement',
        }
      end, opts)

      vim.keymap.set('n', '<leader>sr', function() -- jump to all that you specify
        stf.targeted_jump {
          'return_statement',
        }
      end, opts)

      vim.keymap.set('n', '<leader>sb', function() -- jump to all that you specify
        stf.targeted_jump {
          'statement_block',
        }
      end, opts)

      -- jump to parent or child nodes only
      vim.keymap.set('n', '_', function()
        stf.filtered_jump({
          'if_statement',
          'else_clause',
          'else_statement',
        }, false, { destination = 'parent' })
      end, opts)
      vim.keymap.set('n', '+', function()
        stf.filtered_jump({
          'if_statement',
          'else_clause',
          'else_statement',
        }, true, { destination = 'children' })
      end, opts)
    end,
  },
}
