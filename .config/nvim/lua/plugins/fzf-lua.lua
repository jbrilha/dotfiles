return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },

	config = function()
		local fzf_lua = require("fzf-lua")
		vim.keymap.set("n", "<leader>ff", fzf_lua.files, {})
		vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, {})
		vim.keymap.set("n", "<leader>fb", fzf_lua.buffers, {})
		vim.keymap.set("n", "<leader>fh", fzf_lua.help_tags, {})

		fzf_lua.setup({
			keymap = {
				fzf = {
					true,
					["ctrl-q"] = "select-all+accept",
				},
			},
			grep = {
                hidden = true,
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
