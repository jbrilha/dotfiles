local config = {}

local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.5
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

-- wezterm.on('gui-startup', function(window)
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   local gui_window = window:gui_window();
--   gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
-- end)

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

config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", weight = "Medium", scale = 1.0 },
})
config.font_size = 14.0

config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 5

config.window_decorations = "RESIZE"

config.enable_tab_bar = false

-- need these for left shift + opt combination (aka to use {} "from the left")
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- no more "confirming" tilde
config.use_dead_keys = false

config.keys = {
	{
		key = "0",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("toggle-opacity"),
	},
}

-- turn off ligatures
config.harfbuzz_features = {"calt=0"}

return config
