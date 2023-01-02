return {
	 {
		"catppuccin/nvim",
    lazy = false, 
    priority = 1000,
		config = function()
			vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
			require("catppuccin").setup()
			vim.api.nvim_command "colorscheme catppuccin"
		end
	}
}
