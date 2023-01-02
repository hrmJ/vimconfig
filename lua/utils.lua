function get_setup(name)
  return string.format('require("setup/%s")', name)
end



local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local M = {
  get_setup = get_setup,
	buf_map = buf_map
}

return M
