local M = {}
M.theme = function()
	local colors = {
		darkgray = "#16161d",
		black = "#000000",
		white = "#ffffff",
		gray = "#c0c0c0",
		innerbg = nil,
		outerbg = "#16161D",
		n = "#ff0040",
		i = "#88ff00",
		v = "#ffdd00",
		r = "#ff00ff",
		c = "#ff8800",
	}
	local b = { fg = colors.gray, bg = colors.outerbg }
	local c = { fg = colors.gray, bg = colors.innerbg }
	return {
		inactive = {
			a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
			b = b,
			c = c,
		},
		visual = {
			a = { fg = colors.black, bg = colors.v, gui = "bold" },
			b = b,
			c = c,
		},
		replace = {
			a = { fg = colors.black, bg = colors.r, gui = "bold" },
			b = b,
			c = c,
		},
		normal = {
			a = { fg = colors.black, bg = colors.n, gui = "bold" },
			b = b,
			c = c,
		},
		insert = {
			a = { fg = colors.black, bg = colors.i, gui = "bold" },
			b = b,
			c = c,
		},
		command = {
			a = { fg = colors.black, bg = colors.c, gui = "bold" },
			b = b,
			c = c,
		},
	}
end

local lualine = {
	"nvim-lualine/lualine.nvim",

	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = 'dracula',
				theme = M.theme,
				-- theme = 'auto',
				-- component_separators = { left = '', right = ''},
				-- section_separators = { left = '', right = ''},
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 10,
					-- tabline = 10,
					-- winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "branch", icons_enabled = false }, "diff", "diagnostics" },
				lualine_c = {
					{
						"buffers",
						icons_enabled = false,
						mode = 4,
						buffers_color = {
							-- active = { fg = vim.fn.mode(), bg = '#22242e', gui='bold' },
							active = { fg = vim.fn.mode(), bg = nil, gui = "bold" },
							inactive = { fg = "#919acf", bg = nil },
						},
					},
				},
				lualine_x = { "filesize", "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}

return {}
-- return lualine
