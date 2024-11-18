require("config")
require("snippets")

-- vim.cmd.colorscheme("neon")
vim.cmd.colorscheme("catppuccin-mocha")
-- vim.cmd.colorscheme("bluloco")
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("sleep 50m")
  end,
})
