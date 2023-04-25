local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('i', '<c-j>', "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap('s', '<c-j>', "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap('i', '<c-k>', "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap('s', '<c-k>', "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

return {
  {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    {
      'L3MON4D3/LuaSnip',
      -- follow latest release.
      version = '<CurrentMajor>.*',
      -- install jsregexp (optional!).
      build = 'make install_jsregexp',
      lazy = false,
      config = function()
        require('luasnip').filetype_extend('typescriptreact', { 'javascript', 'typescript' })
        require('luasnip').filetype_extend('typescript', { 'javascript' })
      end,
    },
    'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip',
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-b>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },

        experimental = {
          native_menu = false,
          ghost_text = true,
        },
      }

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'fuzzy_buffer' },
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline', keyword_pattern = [=[[^[:blank:]\!]*]=] },
        }),
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' },
        }, {
          { name = 'buffer' },
        }),
      })

      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
      require('luasnip.loaders.from_vscode').load()
    end,
  },
}
