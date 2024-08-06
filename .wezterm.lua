local wezterm = require("wezterm")

local config = {}

local color_schemes = {
	["Custom (Dark)"] = {
		foreground = "#ffffff",
		background = "#000000",
		cursor_bg = "#00ff00",
		cursor_fg = "#000000",
		cursor_border = "#ff0000",

		selection_fg = "#000000",
		selection_bg = "#ffffff",

		-- ansi = {
		-- 	"#000000", -- 0: Black
		-- 	"#990000", -- 1: Red
		-- 	"#008800", -- 2: Green
		-- 	"#ffe000", -- 3: Yellow
		-- 	"#000088", -- 4: Blue
		-- 	"#bb00bb", -- 5: Magenta
		-- 	"#00cccc", -- 6: Cyan
		-- 	"#e0e0e0", -- 7: White
		-- },
		ansi = {
			"#222222", -- 0: Bright black
			"#ff0000", -- 1: Bright red
			"#00ff00", -- 2: Bright green
			"#ffff00", -- 3: Bright yellow
			"#0000ff", -- 4: Bright blue
			"#ff00ff", -- 5: Bright magenta
			"#00ffff", -- 6: Bright cyan
			"#ffffff", -- 7: Bright white
		},

		brights = {
			"#222222", -- 0: Bright black
			"#ff0000", -- 1: Bright red
			"#00ff00", -- 2: Bright green
			"#ffff00", -- 3: Bright yellow
			"#0000ff", -- 4: Bright blue
			"#ff00ff", -- 5: Bright magenta
			"#00ffff", -- 6: Bright cyan
			"#ffffff", -- 7: Bright white
		},
	},
	["Custom (Light)"] = {
		foreground = "#000000",
		background = "#ffeecc",
		cursor_bg = "#00ff00",
		cursor_fg = "#000000",
		cursor_border = "#ff0000",

		selection_fg = "#000000",
		selection_bg = "#ffffff",

		ansi = {
			"#000000", -- 0: Black
			"#990000", -- 1: Red
			"#008800", -- 2: Green
			"#ffe000", -- 3: Yellow
			"#000088", -- 4: Blue
			"#bb00bb", -- 5: Magenta
			"#00cccc", -- 6: Cyan
			"#e0e0e0", -- 7: White
		},

		brights = {
			"#222222", -- 0: Bright black
			"#ff0000", -- 1: Bright red
			"#00ff00", -- 2: Bright green
			"#ffaf00", -- 3: Bright yellow
			"#0000ff", -- 4: Bright blue
			"#ff00ff", -- 5: Bright magenta
			"#00ffff", -- 6: Bright cyan
			"#ffffff", -- 7: Bright white
		},
	},
}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_schemes = color_schemes
config.color_scheme = "Custom (Dark)"

-- config.color_scheme = 'Argonaut (Gogh)'
-- config.color_scheme = "Campbell (Gogh)"
-- config.color_scheme = 'Colors (base16)'
-- config.color_scheme = "Dark Pastel (Gogh)"
-- config.color_scheme = 'Dark+'
-- config.color_scheme = 'Dissonance (Gogh)'
-- config.color_scheme = 'Dracula (Gogh)'
-- config.color_scheme = 'Ef-Duo-Dark'
-- config.color_scheme = "Ef-Symbiosis"
-- config.color_scheme = 'Ef-Winter'
-- config.color_scheme = 'Elementary'
-- config.color_scheme = 'Elementary (Gogh)'
-- config.color_scheme = 'farmhouse-dark'
-- config.color_scheme = 'FirefoxDev'
-- config.color_scheme = 'Framer'

config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", weight = "Medium", scale = 1.0 },
})
config.font_size = 14.0

config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 5

config.window_decorations = "RESIZE"

config.enable_tab_bar = false

return config
