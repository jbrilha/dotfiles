return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c", "cpp", "java", "lua", "vim", "vimdoc",
					"python", "javascript", "css", "dockerfile",
					"json", "html", "latex", "markdown", "markdown_inline",
					"ruby", "rust", "xml", "yaml", "go", "templ"
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",

		config = function()
            local context = require("treesitter-context")

			context.setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 1, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
            vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true})
            vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", {fg = "#B4BEFE"})
            vim.keymap.set("n", "[c", function()
                context.go_to_context(vim.v.count1)
                vim.api.nvim_feedkeys('zz', 'n', true)
            end, { silent = true })
		end,
	},
}
