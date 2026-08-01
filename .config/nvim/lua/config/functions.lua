local M = {}

function M.close_buffers(right)
	local curr_buf = vim.api.nvim_get_current_buf()

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(buf) and ((buf > curr_buf and right) or (buf < curr_buf and not right)) then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end

function M.close_other_buffers()
	local curr_buf = vim.api.nvim_get_current_buf()

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(buf) and buf ~= curr_buf then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end

-- toggle lines as needed, text becomes redundant if lines are true
function M.toggle_lines()
	vim.diagnostic.config({
		virtual_text = not vim.diagnostic.config().virtual_text,
		virtual_lines = not vim.diagnostic.config().virtual_lines,
	})
end

-- ts_ls, cssls, etc. also advertise documentFormattingProvider and fight with null-ls when I want prettier to kick in
function M.prefer_null_ls(bufnr)
	local has_null_ls = false
	for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/formatting" })) do
		if c.name == "null-ls" then
			has_null_ls = true
			break
		end
	end
	return function(client)
		return not has_null_ls or client.name == "null-ls"
	end
end

function M.toggle_format_on_save()
	vim.g.format_on_save = not vim.g.format_on_save
	print("Format on save: " .. (vim.g.format_on_save and "enabled" or "disabled"))
end

function M.chmod_file()
	local file = vim.fn.expand("%:p")
	vim.fn.system({ "chmod", "+x", file })
	local filename = vim.fn.expand("%:t")
	print("chmod'ed " .. filename)
end

return M
