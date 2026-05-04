return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	ft = "markdown",
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		note_id_func = function(title)
			return title:gsub(" ", "-"):gsub("\\[\\^A-Za-z0-9-\\]", ""):lower()
		end,
		frontmatter = {
			-- enabled = false,
		},
		checkbox = {
			enabled = true,
			create_new = false,
			order = { " ", "~", "!", ">", "x" },
		},
		legacy_commands = false, -- this will be removed in the next major release
		workspaces = {
			{
				name = "ubabel",
				path = "~/vaults/ubabel",
			},
			{
				name = "stoneflux",
				path = "~/vaults/stoneflux",
			},
			{
				name = "paradigm_shift",
				path = "~/vaults/paradigm_shift",
			},
			{
				name = "classes",
				path = "~/vaults/classes",
			},
		},
	},
}
