local funcs = require("config.functions")

-- General
vim.g.mapleader = " "

-- Buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdel<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bca", ":%bd <CR>", { desc = "Close all buffers" })
-- vim.keymap.set("n", "<leader>bco", ":%bd | e# | bd# <CR>", { desc = "Close all *other* buffers" })
-- the function takes longer to close the other buffers but doesn't move my cursor to
-- the start of the file so it's a fair trade-off
vim.keymap.set("n", "<leader>bco", function()
	funcs.close_other_buffers()
end, { desc = "Close all *other* buffers" })
vim.keymap.set("n", "<leader>bcr", function()
	funcs.close_buffers(true)
end, { desc = "Close buffers to the right" })
vim.keymap.set("n", "<leader>bcl", function()
	funcs.close_buffers(false)
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
vim.keymap.set("n", "<leader>R", ":e<CR>Gzz", { desc = "Refresh buffer and jump to EOF" })
vim.keymap.set("n", "<leader>r", ":e<CR>zz", { desc = "Refresh buffer" })

-- Quickfix/Location lists
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = "next in quickfix list" })
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = "Previous in quickfix list" })
vim.keymap.set("n", "<C-w>j", "<cmd>lnext<CR>zz", { desc = "Next in location list" })
vim.keymap.set("n", "<C-w>k", "<cmd>lprev<CR>zz", { desc = "Previous in location list" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })

-- Wrapped Nav
vim.keymap.set({ "v", "n" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "v", "n" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim.keymap.set("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
-- vim.keymap.set("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})

vim.keymap.set("", "<Leader>ll", funcs.toggle_lines, { desc = "Toggle lsp_lines" })

vim.keymap.set("n", "ycc", "yygccp", { remap = true, desc = "Comment then paste below" })
