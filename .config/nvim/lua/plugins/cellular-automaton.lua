return {
	"Eandrju/cellular-automaton.nvim",
	event = "VeryLazy",
	vim.keymap.set("", "<leader>fml", ":CellularAutomaton make_it_rain<CR>"),
	vim.keymap.set("", "<leader>gol", ":CellularAutomaton game_of_life<CR>"),
}
