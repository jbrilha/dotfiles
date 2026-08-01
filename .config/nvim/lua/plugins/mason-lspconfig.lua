return {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"nvim-java/nvim-java",
		lazy = true,
		ft = "java",
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
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"erlangls",
					"ocamllsp",
					"clangd",
					"cmake",
					"lemminx",
					"jdtls",
					"jsonls",
					"dockerls",
					"html",
					-- "ts_ls",
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
					"ltex_plus",
					"sqls",
				},
				automatic_enable = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"barreiroleo/ltex_extra.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local vim = vim
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config.sqls = {
				-- sqls formatting has been broken for ages now
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			}

			-- vim.lsp.enable("earlangls")
			vim.lsp.enable("hls")
			vim.lsp.config.tailwindcss = {
				filetypes = { "templ", "css", "html" },
			}
			vim.lsp.config.erlangls = {
				cmd = { "erlang_ls" },
				filetypes = { "erlang" },
				root_markers = { "rebar.config", ".git" },
			}
			vim.lsp.config.clangd = {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--query-driver=**/xtensa-esp*-elf-*,**/riscv32-esp-elf-*",
				},
			}
			vim.lsp.config.ltex_plus = {
				on_attach = function(client, bufnr)
					require("ltex_extra").setup({
						load_langs = { "en-US", "pt" },
						path = vim.fn.expand("~") .. "/.local/share/ltex",
					})
				end,
				-- settings = {
				-- 	ltex = {
				-- 		dictionary = {
				-- 			["en-US"] = { "fanout" },
				-- 		},
				-- 	},
				-- },
			}
			vim.lsp.config.pylsp = {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								maxLineLength = 80,
							},
						},
					},
				},
			}

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
					vim.keymap.set("v", "<leader>gf", function()
						vim.lsp.buf.format({ filter = require("config.functions").prefer_null_ls(ev.buf) })
					end, opts)
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
