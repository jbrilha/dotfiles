return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets'
        -- 'lukas-reineke/cmp-under-comparator',
        -- 'hrsh7th/cmp-buffer',
        -- 'lukas-reineke/cmp-rg',
    },
    config = function()
        local cmp = require('cmp')
        -- local compare = require('cmp.config.compare')
        -- local luasnip = require('luasnip')
        -- luasnip.config.setup({})
        
        require('luasnip.loaders.from_vscode').lazy_load()


        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete({}),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                -- { name = 'nvim_lua' },
            }, {
                { name = 'buffer' },
            }),
        })
    end,
}
