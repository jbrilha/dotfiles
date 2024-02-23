return{
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
    config = function ()
        require("ibl").setup({
            scope = {
                -- highlight = highlight,
                enabled = true,
                show_start = true,
                show_end = true,
            }
        })
    end
}
