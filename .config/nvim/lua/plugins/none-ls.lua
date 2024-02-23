return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = {
                        "-style=file:" .. vim.fn.expand("~/.local/share/nvim/mason/bin/.clang-format")
                        -- Alternatively, place .clang.format in ~/ and delete everything after -style=file
                    }
                }),
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.diagnostics.flake8,
                -- null_ls.builtins.completion.spell,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
