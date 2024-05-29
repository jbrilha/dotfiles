local M = {}
    M.theme = function()
        local colors = {
            darkgray = "#16161d",
            black = "#000000",
            white = "#ffffff",
            gray = "#c0c0c0",
            innerbg = nil,
            outerbg = "#16161D",
            normal = "#ff0040",
            insert = "#88ff00",
            visual = "#ffdd00",
            replace = "#ff0000",
            command = "#ff8800",
        }
        local b = { fg = colors.gray, bg = colors.outerbg }
        local c = { fg = colors.gray, bg = colors.innerbg }
        return {
            inactive = {
                a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
                b = b,
                c = c,
            },
            visual = {
                a = { fg = colors.black, bg = colors.visual, gui = "bold" },
                b = b,
                c = c,
            },
            replace = {
                a = { fg = colors.black, bg = colors.replace, gui = "bold" },
                b = b,
                c = c,
            },
            normal = {
                a = { fg = colors.black, bg = colors.normal, gui = "bold" },
                b = b,
                c = c,
            },
            insert = {
                a = { fg = colors.black, bg = colors.insert, gui = "bold" },
                b = b,
                c = c,
            },
            command = {
                a = { fg = colors.black, bg = colors.command, gui = "bold" },
                b = b,
                c = c,
            },
        }
    end

return {
    "nvim-lualine/lualine.nvim",

    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                -- theme = 'dracula',
                theme = M.theme,
                -- theme = 'auto',
                -- component_separators = { left = '', right = ''},
                -- section_separators = { left = '', right = ''},
                component_separators = { left = '|', right = '|'},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {{'branch', icons_enabled = false}, 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'buffers',
                        icons_enabled = false,
                        mode = 4,
                        buffers_color = {
                            -- active = { fg = vim.fn.mode(), bg = '#22242e', gui='bold' },
                            active = { fg = vim.fn.mode(), bg = nil, gui='bold' },
                            inactive = { fg = '#919acf', bg = nil},
                        },
                    }
                },
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        })
    end
}
