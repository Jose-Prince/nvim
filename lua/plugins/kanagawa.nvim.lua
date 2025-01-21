return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.g.kanagawa_enable_bold = true
			vim.g.kanagawa_enable_italic = true
			vim.g.kanagawa_theme = "dragon"
			vim.g.kanagawa_visibility = "on"

			local kanagawa = require('kanagawa')
			kanagawa.setup{
				compile = false,
				undercurl = true,
				dimInactive = true,
				globalOverride = false,
			}

			vim.cmd 'colorscheme kanagawa'
		end
	}
}
