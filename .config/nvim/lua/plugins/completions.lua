return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdLineEnter' },
    dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        -- 'lukas-reineke/cmp-under-comparator',
        'hrsh7th/cmp-buffer',
        -- 'lukas-reineke/cddmp-rg',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    },
    config = function()
        local cmp = require('cmp')
        -- local compare = require('cmp.config.compare')
        local luasnip = require('luasnip')
        -- luasnip.config.setup({})

        require('luasnip.loaders.from_vscode').lazy_load()
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete({}),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
            }),
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
            {
                { name = 'buffer' },
                { name = 'path' },
            }),
            experimental = {
                ghost_text = true
            }
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                    { name = 'cmdline' }
                })
        })
    end,
}
