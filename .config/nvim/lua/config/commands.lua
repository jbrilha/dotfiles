vim.api.nvim_create_user_command("W", "write", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Q", "quit", {})
vim.api.nvim_create_user_command("Qa", "quitall", {})

local function oil_sexplore(opts)
	local oil = require("oil")
	if opts.bang then
		vim.cmd("vsplit | wincmd l")
		oil.open()
	else
		vim.cmd("split | wincmd j")
		oil.open()
	end
end

-- this with setting oil to default explorer basically replaces netrw as I used
-- it before, neat
vim.api.nvim_create_user_command("Sexplore", oil_sexplore, { bang = true })

local funcs = require("config.functions")

vim.g.format_on_save = true

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("FormatOnSave", {}),
	callback = function(args)
		if vim.g.format_on_save then
			vim.lsp.buf.format({
				bufnr = args.buf,
				timeout_ms = 2000,
				filter = funcs.prefer_null_ls(args.buf),
			})
		end
	end,
})
