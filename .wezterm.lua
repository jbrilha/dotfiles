local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.color_scheme = 'Argonaut (Gogh)'
-- config.color_scheme = "Campbell (Gogh)"
-- config.color_scheme = 'Colors (base16)'
config.color_scheme = 'Dark Pastel (Gogh)'
-- config.color_scheme = 'Dark+'
-- config.color_scheme = 'Dissonance (Gogh)'
-- config.color_scheme = 'Dracula (Gogh)'
-- config.color_scheme = 'Ef-Duo-Dark'
-- config.color_scheme = 'Ef-Symbiosis'
-- config.color_scheme = 'Ef-Winter'
-- config.color_scheme = 'Elementary'
-- config.color_scheme = 'Elementary (Gogh)'

config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", weight = "Medium", scale = 1.0 },
})
config.font_size = 14.0
-- config.unicode_version = 14
config.window_background_opacity = 0.9
-- config.text_background_opacity = 0.5
config.window_decorations = "RESIZE"

config.enable_tab_bar = false

return config
