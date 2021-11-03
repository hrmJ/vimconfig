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
    lualine_a = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    }
  },
   tabline = {
   },
})
