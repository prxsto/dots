-- Initialize Configuration
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font_with_fallback({
	{
		family = "Berkeley Mono",
	},
	"San Francisco Mono",
})
config.font_size = 18

-- Window
config.initial_rows = 50
config.initial_cols = 180
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.90
config.macos_window_background_blur = 100
config.max_fps = 120
config.animation_fps = 120
config.cursor_blink_rate = 250

-- Colors
config.color_scheme = "Ayu Dark (Gogh)"
-- config.force_reverse_video_cursor = true

return config
-- Initialize Configuraion
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- OS-specific config
local is_windows = wezterm.target_triple:find("windows") ~= nil

if is_windows then
   config.default_domain = "WSL:archlinux"
   config.default_cwd = '~'

   config.font_size = 14
   config.initial_rows = 30
   config.initial_cols = 120
   config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
   config.integrated_title_buttons = { 'Close' }
else
   config.default_cwd = wezterm.home_dir

   config.font_size = 18
   config.initial_rows = 50
   config.initial_cols = 180
   config.window_decorations = "RESIZE"
end

-- Font
config.font = wezterm.font_with_fallback({
   {
      family = "Berkeley Mono",
   },
   "San Francisco Mono",
})

-- Window
config.enable_tab_bar = false
config.window_background_opacity = 0.90
config.macos_window_background_blur = 100
config.max_fps = 120

-- Colors
config.color_scheme = "Ayu Dark (Gogh)"
-- config.force_reverse_video_cursor = true

return config
