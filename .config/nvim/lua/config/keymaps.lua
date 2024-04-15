-- General
vim.g.mapleader = " "

-- Buffers
vim.keymap.set('n', '<leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<leader>bp', ':bprev<CR>')

-- LiveServer
vim.keymap.set('n', '<leader>ls', ':LiveServerStart<CR>')
vim.keymap.set('n', '<leader>lk', ':LiveServerStop<CR>')

-- Trouble
vim.keymap.set('n', '<leader>xx', ':TroubleToggle<CR>')

-- Cellular Automaton
vim.keymap.set('', '<leader>fml', ':CellularAutomaton make_it_rain<CR>')
vim.keymap.set('', '<leader>gol', ':CellularAutomaton game_of_life<CR>')

-- Copy/paste to and from clipboard
vim.keymap.set('', '<leader>y', '"+y')
-- vim.keymap.set('', '<leader>Y', '"+yg_')
vim.keymap.set('', '<leader>Y', 'V"+y')
vim.keymap.set('', '<leader>p', '"+p')
vim.keymap.set('', '<leader>P', '"+P')

-- Find and replace word under cursor
vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/')
-- vim.keymap.set('v', '<leader>s', ':%s/\\<<C-r>@\\>/')
-- vim.keymap.set('v', '<leader>s', [[:%s/\V<C-r>=@<CR>//g<Left><Left>]])

-- vim.keymap.set('', '-', '')
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
