require("config")
require("snippets")

local theme = require("config.theme")

local function apply_colorscheme()
	if theme.is_dark_mode() then
		vim.o.background = "dark"
		vim.cmd.colorscheme("catppuccin-mocha")
	else
		vim.o.background = "light"
		vim.cmd.colorscheme("catppuccin-latte")
	end
end

apply_colorscheme()

-- vim.api.nvim_create_autocmd("FocusGained", {
-- 	callback = apply_colorscheme,
-- })
