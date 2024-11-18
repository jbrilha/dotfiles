-- General
vim.g.mapleader = " "

local function close_buffers(right)
	local curr_buf = vim.api.nvim_get_current_buf()

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(buf)
            and (
                (buf > curr_buf and right) or
                (buf < curr_buf and not right)
            ) then

			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end

local function close_other_buffers()
	local curr_buf = vim.api.nvim_get_current_buf()

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(buf)
            and buf ~= curr_buf then

			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end

-- Buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdel<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bca", ":%bd <CR>", { desc = "Close all buffers" })
-- vim.keymap.set("n", "<leader>bco", ":%bd | e# | bd# <CR>", { desc = "Close all *other* buffers" })
-- the function takes longer to close the other buffers but doesn't move my cursor to
-- the start of the file so it's a fair trade-off
vim.keymap.set("n", "<leader>bco", function()
	close_other_buffers()
end, { desc = "Close all *other* buffers" })
vim.keymap.set("n", "<leader>bcr", function()
	close_buffers(true)
end, { desc = "Close buffers to the right" })
vim.keymap.set("n", "<leader>bcl", function()
	close_buffers(false)
end, { desc = "Close buffers to the left" })
-- global bdelete | edit last buffer | bdelete last buffer which was [No Name]

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })

-- Copy/paste to and from clipboard
vim.keymap.set("", "<leader>y", '"+y')
vim.keymap.set("", "<leader>Y", 'V"+y')
vim.keymap.set("", "<leader>p", '"+p')
vim.keymap.set("", "<leader>P", '"+P')

-- Find and replace word under cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/")

-- Jumps
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- Reload file
vim.keymap.set("n", "<leader>R", ":e<CR>G", { desc = "Refresh buffer and jump to EOF" })
vim.keymap.set("n", "<leader>r", ":e<CR>", { desc = "Refresh buffer" })

-- Quickfix/Location lists
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")

-- Wrapped Nav
vim.keymap.set({ "v", "n" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "v", "n" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim.keymap.set("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
-- vim.keymap.set("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})

-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
