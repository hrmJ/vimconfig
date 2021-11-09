
require'navigator'.setup({
   icons = {
      diagnostic_err = "",
      diagnostic_warn = " ", diagnostic_hint = " "
   },
   lsp = {
     code_action = {enable = true, sign = false, sign_priority = 40, virtual_text = false},
     format_on_save = true,
     diagnostic_virtual_text = false,
     diagnostic_underline = false,
     diagnostic_update_in_insert = false,
     flags = {allow_incremental_sync = true, debounce_text_changes = 1000},
     tsserver = {
         -- filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact"},
         on_attach = function(client, bufnr)
             local ts_utils = require("nvim-lsp-ts-utils")

             ts_utils.setup {
                 debug = false,
                 disable_commands = false,
                 enable_import_on_completion = false,
                 import_on_completion_timeout = 5000,
                 -- eslint
                 eslint_enable_code_actions = true,
                 eslint_bin = "eslint_d",
                 -- eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
                 eslint_enable_disable_comments = true,
                 -- eslint diagnostics
                 eslint_enable_diagnostics = false,
                 eslint_diagnostics_debounce = 250,
                 -- formatting
                 enable_formatting = true,
                 formatter = "prettierd",
                 formatter_args = {"--stdin-filepath", "$FILENAME"},
                 no_save_after_format = false,
                 -- parentheses completion
                 complete_parens = false,
                 signature_help_in_parens = true,
                 -- update imports on file move
                 update_imports_on_move = true,
                 require_confirmation_on_move = false,
             }
             client.resolved_capabilities.document_formatting = false
             -- define an alias
             vim.cmd("command -buffer Formatting lua vim.lsp.buf.formatting()")
             vim.cmd("command -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
             -- format on save
             vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
             ts_utils.setup_client(client)
         end
    }
   }
 }
)
