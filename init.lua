require 'plugins'
require 'lsp.setup'
require 'keys'
require 'tree-sitter-setup'
require 'cmp-config'
require 'statusline'
require 'syntax-tree-surf'

vim.o.termguicolors = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.hidden = true
vim.o.updatetime = 250

vim.cmd [[

  "let g:lightspeed_no_default_keymaps = 1
  set autoindent
  set expandtab
  set shiftwidth=2
  set smartindent
  set softtabstop=2
  set tabstop=2
  set nohlsearch

  let g:ultest_use_pty = 1
  let test#javascript#reactscripts#options = "--watchAll=false"
  colorscheme nordfox
  let g:markdown_folding = 0
  au TermOpen * tnoremap <A-o> <c-\><c-n>
  set clipboard=unnamedplus


  hi ActiveWindow guibg=#21242b
  hi InactiveWindow guibg=#282c34

  " Call method on window enter
  augroup WindowManagement
    autocmd!
    autocmd WinEnter * call Handle_Win_Enter()
  augroup END

  " Change highlight group of active/inactive windows
  function! Handle_Win_Enter()
    setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
   endfunction

   "set winbar=%f
   set showtabline=0

]]

vim.cmd 'source ~/.config/nvim/keys.vim'



require('nvim-autopairs').setup {}
require('nvim-web-devicons').setup {}
require'marks'.setup {}

local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions

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
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
      mappings = {
        i = {
            ["<C-o>"] = fb_actions.create_from_prompt, 
        },
        n = {
          ["<C-h>"] = fb_actions.goto_home_dir,
        },
      },
    },
  },
}

require('telescope').load_extension 'fzf'
require('telescope').load_extension 'termfinder'
require('telescope').load_extension 'heading'
require('telescope').load_extension 'file_browser'
require("telescope").load_extension('harpoon')

--require('nvim-tree').setup {
--  disable_netrw = false,
--  hijack_netrw = false,
--}

require('gitsigns').setup {
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n <c-j>'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
    ['n <c-k>'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
  },
}

vim.diagnostic.config {
  virtual_text = false,
  float = {
    source = 'always',
    border = border,
  },
}

require('toggleterm').setup {
  open_mapping = [[<leader>T]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
}


require('specs').setup {}

require('lsp_signature').setup()

require("react-extract").setup()

require('yode-nvim').setup({})

require('inc_rename').setup({})

require('peepsight').setup({
  -- typescript
  "arrow_function",
  "function_declaration",
  "generator_function_declaration"
})

vim.keymap.set({ "v" }, "<Leader>re", require("react-extract").extract_to_new_file)
