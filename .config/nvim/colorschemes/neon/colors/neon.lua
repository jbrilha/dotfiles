vim.opt.background = 'dark'
vim.g.colors_name = 'neon'

package.loaded['lush_theme.neon'] = nil

require('lush')(require('lush_theme.neon'))

