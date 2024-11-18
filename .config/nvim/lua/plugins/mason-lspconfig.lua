return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"nvim-java/nvim-java",
		dependencies = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pylsp",
					"clangd",
					"cmake",
					"lemminx",
					"jdtls",
					"jsonls",
					"dockerls",
					"html",
					"ts_ls",
					"eslint",
					"texlab",
					"lua_ls",
					"marksman",
					"rust_analyzer",
					"glsl_analyzer",
					"gopls",
					"templ",
					"cssls",
					"tailwindcss",
					"ltex",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local vim = vim
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities = capabilities

			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				root_dir = function()
					return vim.loop.cwd()
				end,
				settings = {
					javascript = {
						format = {
							enable = true,
						},
					},
				},
			})
			lspconfig.lemminx.setup({
				capabilities = capabilities,
				settings = {
					xml = {
						server = {
							workDir = "~/.cache/lemminx",
						},
					},
				},
			})
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cmake.setup({ capabilities = capabilities })
			-- lspconfig.eslint.setup({
			-- 	capabilities = capabilities,
			-- 	settings = {
			-- 		experimental = {
			-- 			-- allows using flat config format
			-- 			useFlatConfig = true,
			-- 		},
			-- 	},
			-- })
			lspconfig.ltex.setup({ capabilities = capabilities })
			-- lspconfig.texlab.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.marksman.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.glsl_analyzer.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({
				capabilities = capabilities,
				settings = {
					java = {
						project = {
							referencedLibraries = {
								"libs/*.jar",
							},
						},
					},
				},
			})
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({
				capabilities = capabilities,
				-- settings = {
				-- 	gopls = {
				-- 		usePlaceholders = true,
				-- 	},
				-- },
			})
			lspconfig.templ.setup({ capabilities = capabilities })
			-- lspconfig.cssls.setup({ capabilities = capabilities })

			-- This makes wezterm ask for permissions everytime
			-- lspconfig.tailwindcss.setup({ capabilities = capabilities })

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					-- vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("v", "<leader>gf", vim.lsp.buf.format, opts)
				end,
			})
			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
		end,
	},
}
