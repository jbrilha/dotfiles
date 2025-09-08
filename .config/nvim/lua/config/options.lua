vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number relativenumber")
vim.cmd("set cursorline")
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.o.undofile = true

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = true, -- default but here for clarity
    virtual_lines = false, -- start with lsp_lines disabled
    signs = {
        text = {        -- this disables gutter icons
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
        numhl = { -- and this colors the line numbers according to the line diagnostic :) neat
            [vim.diagnostic.severity.WARN] = "WarningMsg",
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticHint",
        },
    },
})

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
