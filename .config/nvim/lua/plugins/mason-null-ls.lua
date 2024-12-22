return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
		-- "nvimtools/none-ls-extras.nvim",
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
                -- "latexindent",
				-- "eslint_lsp",
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
            -- debug = true,
			sources = {
                -- This fucks up my markdown formatting??
				-- null_ls.builtins.formatting.latexindent,
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.luaformatter,
				null_ls.builtins.formatting.ocamlformat,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.clang_format.with({
					extra_args = {
						"-style=file:" .. vim.fn.expand("~/.local/share/nvim/mason/bin/.clang-format"),
						-- Alternatively, place .clang.format in ~/ and delete everything after -style=file
					},
				}),
				-- null_ls.builtins.formatting.gofumpt,
				-- null_ls.builtins.formatting.goimports_reviser,
				-- null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.golines.with({
                    extra_args = {
                        "--no-chain-split-dots"
                    }
                }),
                -- require("none-ls.diagnostics.eslint"),
				-- null_ls.builtins.diagnostics.eslint,
				-- null_ls.builtins.diagnostics.flake8,
				-- null_ls.builtins.completion.spell,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
-- return {}
