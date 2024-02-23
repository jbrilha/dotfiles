return {
	{
		"navarasu/onedark.nvim",
		name = "onedark",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",

		opts = {
			transparent_background = true,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
			integrations = {
				telescope = {
					enabled = true,
					-- style = "nvchad",
				},
				neotree = true,
				treesitter = true,
				cmp = true,
				which_key = true,
				noice = true,
			},
		},
	},
}
