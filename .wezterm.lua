local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.color_scheme = 'Argonaut (Gogh)'
config.color_scheme = 'Campbell (Gogh)'
-- config.color_scheme = 'Colors (base16)'
-- config.color_scheme = 'Dark Pastel (Gogh)'

config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", weight = "Medium", scale = 1.0 },
	-- "Noto Color Emoji",
})
config.font_size = 15.0
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"

-- config.use_fancy_tab_bar = true
config.enable_tab_bar = false

return config
