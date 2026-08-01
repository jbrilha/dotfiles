return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
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
			},
			automatic_installation = true,
			handlers = {
				function() end,
				stylua = function(source_name, methods)
					null_ls.register(null_ls.builtins.formatting.stylua)
				end,
			},
		})

		local pg_dialect = { "--dialect", "postgres" }

		null_ls.setup({
			-- debug = true,
			sources = {
				-- This fucks up my markdown formatting??
				-- null_ls.builtins.formatting.latexindent,
				null_ls.builtins.formatting.ocamlformat,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.sqlfluff.with({
					extra_args = pg_dialect,
				}),
				null_ls.builtins.formatting.sqlfluff.with({
					extra_args = pg_dialect,
				}),
				null_ls.builtins.formatting.clang_format.with({
					extra_args = {
						"-style=file:" .. vim.fn.expand("~/.clang-format"),
						-- Alternatively, place .clang.format in ~/ and delete everything after -style=file
					},
				}),
			},
		})
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ filter = require("config.functions").prefer_null_ls(0) })
		end, {})
	end,
}
-- return {}
