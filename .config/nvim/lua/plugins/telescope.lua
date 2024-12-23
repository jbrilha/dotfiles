return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sharkdp/fd",
            "BurntSushi/ripgrep",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files)
            vim.keymap.set("n", "<leader>fg", builtin.live_grep)
            vim.keymap.set("n", "<leader>fb", builtin.buffers)
            vim.keymap.set("n", "<leader>fh", builtin.help_tags)
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    file_ignore_patterns = {
                        ".class",
                        ".git/",
                        "target/",
                        "_templ.go",
                        ".dat",
                        "bin/",
                        ".cache/",
                        "build/",
                    },
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            ["<C-h>"] = "which_key",
                        },
                    },
                },
                pickers = {
                    find_files = {
                        no_ignore = true,
                        hidden = true,
                    },
                    live_grep = {
                        additional_args = function(opts)
                            return { "--hidden" }
                        end,
                    },
                },
                extensions = {
                    ["ui-select"] = require("telescope.themes").get_dropdown({}),
                    fzf = {},
                },
            })
            telescope.load_extension("ui-select")
            telescope.load_extension("fzf")
        end,
    },
}
