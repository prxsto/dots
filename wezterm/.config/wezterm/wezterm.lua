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
config.color_scheme = "Tokyo Night"
-- config.force_reverse_video_cursor = true

return config
