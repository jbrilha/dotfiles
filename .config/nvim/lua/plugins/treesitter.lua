return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed =
                { "c", "cpp", "java", "lua", "vim", "vimdoc", "python",
                  "javascript", "css", "dockerfile", "json", "html", "latex",
                  "markdown", "markdown_inline", "ruby", "rust", "xml", "yaml"
                },
            auto_install = true,
            highlight = { enable = truee },
            indent = { enable = true },
        }
    end
}
