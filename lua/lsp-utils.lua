local utils = require 'utils'

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  vim.cmd 'command! LspDef lua vim.lsp.buf.definition()'
  vim.cmd 'command! LspFormatting lua vim.lsp.buf.format()'
  vim.cmd 'command! LspCodeAction lua vim.lsp.buf.code_action()'
  vim.cmd 'command! LspHover lua vim.lsp.buf.hover()'
  vim.cmd 'command! LspRename lua vim.lsp.buf.rename()'
  vim.cmd 'command! LspRefs lua vim.lsp.buf.references()'
  vim.cmd 'command! LspTypeDef lua vim.lsp.buf.type_definition()'
  vim.cmd 'command! LspImplementation lua vim.lsp.buf.implementation()'
  vim.cmd 'command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()'
  vim.cmd 'command! LspDiagNext lua vim.lsp.diagnostic.goto_next()'
  vim.cmd 'command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()'
  vim.cmd 'command! LspSignatureHelp lua vim.lsp.buf.signature_help()'
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  utils.buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
  utils.buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
  utils.buf_map(bufnr, 'n', 'gy', ':LspTypeDef<CR>')
  utils.buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
  utils.buf_map(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
  utils.buf_map(bufnr, 'n', ']a', ':LspDiagNext<CR>')
  utils.buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
  utils.buf_map(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')
  utils.buf_map(bufnr, 'i', '<C-x><C-x>', '<cmd> LspSignatureHelp<CR>')
  if client.server_capabilities.document_formatting then
    vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
  end


  if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              vim.lsp.buf.format({bufnr = bufnr})
          end,
      })
  end

utils.buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
utils.buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
utils.buf_map(bufnr, 'n', 'gy', ':LspTypeDef<CR>')
utils.buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
utils.buf_map(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
utils.buf_map(bufnr, 'n', ']a', ':LspDiagNext<CR>')
utils.buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
utils.buf_map(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')
utils.buf_map(bufnr, 'i', '<C-x><C-x>', '<cmd> LspSignatureHelp<CR>')
if client.server_capabilities.document_formatting then
  vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
end

if client.supports_method 'textDocument/formatting' then
  vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = function()
      -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
      vim.lsp.buf.format { bufnr = bufnr }
    end,
  })
end

local M = {
  on_attach = on_attach,
}

return M
