return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		require("mason").setup()
		local null_ls = require("null-ls")

		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"black",
				"isort",
				"clang_format",
				-- "eslint_d",
				-- "flake8",
			},
			automatic_installation = true,
			handlers = {
				function() end,
				stylua = function(source_name, methods)
					null_ls.register(null_ls.builtins.formatting.stylua)
				end,
			},
		})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.clang_format.with({
					extra_args = {
						"-style=file:" .. vim.fn.expand("~/.local/share/nvim/mason/bin/.clang-format"),
						-- Alternatively, place .clang.format in ~/ and delete everything after -style=file
					},
				}),
				-- null_ls.builtins.diagnostics.eslint_d,
				-- null_ls.builtins.diagnostics.flake8,
				-- null_ls.builtins.completion.spell,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
-- return {}
