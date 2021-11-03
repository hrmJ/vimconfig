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
  options =  {
    theme = 'OceanicNext'
  },
  sections = {
    lualine_x = {
      { gps.get_location, condition = gps.is_available },
    },
  },
   tabline = {
   },
})
