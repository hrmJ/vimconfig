local gps = require("nvim-gps")

require("nvim-gps").setup({
	icons = {
		["class-name"] = ' ',      -- Classes and class-like objects
		["function-name"] = ' ',   -- Functions
		["method-name"] = ' '      -- Methods (functions inside class-like objects)
	},
	-- Disable any languages individually over here
	-- Any language not disabled here is enabled by default
	languages = {
	},
	separator = ' > ',
})

require("lualine").setup({
  extensions = {
    'fzf'
  },
  sections = {
    lualine_c = {
      { gps.get_location, condition = gps.is_available },
    },
  },
  -- tabline = {
  --   lualine_c = {},
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_y = {},
  --   lualine_z = {}
  -- },
})
