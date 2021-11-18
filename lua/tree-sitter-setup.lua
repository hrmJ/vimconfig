require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  folding = {
    enable=true
  },
  indent = {
    enable=true
  },
  autotag = {
    enable=true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
vim.cmd [[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]]

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.markdown = {
  install_info = {
    url = "~/projects/tree-sitter-markdown", -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "markdown", -- if filetype does not agrees with parser name
  --used_by = {"bar", "baz"} -- additional filetypes that use this parser
}
