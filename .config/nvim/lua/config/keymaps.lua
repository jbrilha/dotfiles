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

