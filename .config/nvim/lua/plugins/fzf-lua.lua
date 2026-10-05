return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },

	config = function()
		local fzf_lua = require("fzf-lua")

		do
			local manpages = require("fzf-lua.providers.manpages")
			local orig_manpage_sh_arg = manpages.manpage_sh_arg
			manpages.manpage_sh_arg = function(apropos_line)
				local ok, ret = pcall(orig_manpage_sh_arg, apropos_line)
				return ok and ret or ""
			end
		end

		vim.keymap.set("n", "<leader>ff", fzf_lua.files, {})
		vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, {})
		vim.keymap.set("n", "<leader>fb", fzf_lua.buffers, {})
		vim.keymap.set("n", "<leader>ft", fzf_lua.tabs, {})
		vim.keymap.set("n", "<leader>fl", fzf_lua.lines, {})
		vim.keymap.set("n", "<leader>fh", fzf_lua.help_tags, {})
		vim.keymap.set("n", "<leader>fm", fzf_lua.man_pages, {})

		fzf_lua.setup({
			keymap = {
				fzf = {
					true,
					["ctrl-q"] = "select-all+accept",
				},
			},
			files = {
				prompt = "fzf ❯ ",
				git_icons = true,
			},
			grep = {
				hidden = true,
				prompt = "rg ❯ ",
				follow = true,
			},
			buffers = {
				prompt = "bufs ❯ ",
			},
			tabs = {
				prompt = "tabs ❯ ",
			},
			lines = {
				prompt = "lines ❯ ",
			},
			diagnostics = {
				prompt = "diagnostics ❯ ",
			},
			helptags = {
				prompt = "help ❯ ",
			},
			manpages = {
				prompt = "man ❯ ",
				previewer = "man_native",
			},
		})

		vim.ui.select = function(items, opts, on_choice)
			local ui_select = require("fzf-lua.providers.ui_select")
			if not ui_select.is_registered() then
				ui_select.register(function(ui_opts)
					ui_opts.winopts = { height = 0.5, width = 0.4 }
					if ui_opts.kind then
						ui_opts.winopts.title = " " .. ui_opts.kind .. " "
					end
					return ui_opts
				end)
			end

			if #items > 0 then
				return vim.ui.select(items, opts, on_choice)
			end
		end
	end,
}
