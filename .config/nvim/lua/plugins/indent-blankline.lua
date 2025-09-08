return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("ibl").setup({
			-- scope = {
			-- 	{
			-- 		enabled = true,
			-- 		show_start = true,
			-- 		show_end = false,
			-- 		injected_languages = false,
			-- 		highlight = { "Function", "Label" },
			-- 		priority = 500,
			-- 	},
			-- },
		})
	end,
}
