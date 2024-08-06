local colors32 = {
	black = "#000000",
	dark_red = "#880000",
	red = "#ff0000",
	light_red = "#f44f4f",
	dark_orange = "#ff6600",
	orange = "#ff8800",
	light_orange = "#ffaa44",
	dark_yellow = "#ffcc00",
	yellow = "#ffff00",
	light_yellow = "#ffff80",
	dark_green = "#004400",
	green = "#00ff00",
	light_green = "#8fff8f",
	dark_cyan = "#008b8b",
	cyan = "#00ffff",
	light_cyan = "#80ffff",
	dark_blue = "#000088",
	blue = "#0000ff",
	light_blue = "#1e90ff",
	dark_purple = "#400088",
	purple = "#8000ff",
	light_purple = "#a000ff",
	dark_magenta = "#8f008f",
	magenta = "#ff00ff",
	light_magenta = "#cc40cc",
	dark_gray = "#202020",
	gray = "#808080",
	light_gray = "#b0b0b0",
	white = "#ffffff",
}

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",

		opts = {
			transparent_background = true,
			styles = {
				comments = { "italic", "bold" },
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
				-- mocha = {
				-- 	base = "#000000",
				-- 	mantle = "#101010",
				-- 	crust = "#0000ff",
				-- 	peach = "#ff8000",
				-- 	green = "#00ff00",
				--                 mauve = "#ff0040",
				--                 lavender = "#7030ff",
				--                 sky = "#00ffff",
				--                 blue = "#0060ff",
				--                 rosewater = "#ffff00",
				--                 yellow = "#ffdd00",
				-- },
			},
			custom_highlights = function(colors)
				return {
					Comment = { fg = colors32.dark_green },
					Constant = { fg = colors32.orange },
					Number = { fg = colors32.magenta },
					Operator = { fg = colors32.cyan },
					TabLineSel = { bg = colors32.orange, fg = colors32.black },
				}
			end,
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
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			require("bluloco").setup({
				style = "dark", -- "auto" | "dark" | "light"
				transparent = true,
				italics = true,
				terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
				guicursor = true,
			}) -- your optional config goes here, see below.
		end,
	},
	{
		"navarasu/onedark.nvim",
		name = "onedark",
	},
	{
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
		lazy = false,
		priority = 1000,
		opts = {
			-- Enable transparent background
			transparent = true,

			-- Enable italics comments
			italic_comments = true,

			-- Replace all fillchars with ' ' for the ultimate clean look
			hide_fillchars = false,

			-- Modern borderless telescope theme
			borderless_telescope = false,

			-- Set terminal colors used in `:terminal`
			terminal_colors = true,

			theme = {
				variant = "default",
				highlights = {
					-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

					-- Example:
					Comment = { fg = "#004400", bg = "NONE", italic = true },
					["@property"] = { fg = "#ff0040", bold = true },

					-- Complete list can be found in `lua/cyberdream/theme.lua`
				},
			},

			-- Disable or enable colorscheme extensions
			extensions = {
				telescope = true,
				notify = true,
				mini = true,
				...,
			},
		},
	},
}

-- local colors64 = {
--     black = "#000000",
--     dark_red = "#800000",
--     brown = "#a52a2a",
--     sienna = "#a0522d",
--     dark_sienna = "#8a360f",
--     chocolate = "#d2691e",
--     dark_orange = "#ff8c00",
--     dark_yellow = "#9b870c",
--     gold = "#ffc300",
--     orange = "#ffa500",
--     tomato = "#ff6347",
--     dark_salmon = "#e9967a",
--     salmon = "#fa8072",
--     light_salmon = "#ffa07a",
--     coral = "#ff7f50",
--     dark_coral = "#cd5b45",
--     crimson = "#dc143c",
--     red = "#ff0000",
--     deeppink = "#ff1493",
--     hotpink = "#ff69b4",
--     pink = "#ffc0cb",
--     light_red = "#ffcccb",
--     light_magenta = "#ffb6c1",
--     violet = "#ee82ee",
--     dark_violet = "#9400d3",
--     orchid = "#da70d6",
--     light_violet = "#d8bfd8",
--     purple = "#8000ff",
--     dark_magenta = "#8b008b",
--     indigo = "#4b0082",
--     mediumslateblue = "#7b68ee",
--     blue = "#0000ff",
--     dark_blue = "#00008b",
--     navy = "#000080",
--     light_blue = "#add8e6",
--     skyblue = "#87ceeb",
--     deepskyblue = "#00bfff",
--     dodgerblue = "#1e90ff",
--     cornflowerblue = "#6495ed",
--     steelblue = "#4682b4",
--     teal = "#008080",
--     dark_cyan = "#008b8b",
--     cyan = "#00ffff",
--     light_cyan = "#e0ffff",
--     light_teal = "#20b2aa",
--     green = "#008000",
--     dark_green = "#006400",
--     lime = "#00ff00",
--     light_green = "#90ee90",
--     dark_olive = "#bdb76b",
--     olive = "#808000",
--     yellow = "#ffff00",
--     light_yellow = "#ffffe0",
--     gray = "#808080",
--     dark_gray = "#a9a9a9",
--     light_gray = "#d3d3d3",
--     silver = "#c0c0c0",
--     white = "#ffffff",
-- }
