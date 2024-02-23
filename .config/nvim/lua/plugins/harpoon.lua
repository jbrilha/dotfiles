return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
        vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
        vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
        vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
        vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, {desc = "Add to Harpoon list"})
        vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
    end
}
