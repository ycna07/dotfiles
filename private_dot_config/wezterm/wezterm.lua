local wezterm = require("wezterm")
local config = wezterm.config_builder()
local wez = wezterm
local keys = require("keys")
config.keys = keys.bindings
-- config.mouse_bindings = keys.mouse_bindings

-- Neovide-style deforming smear (default: disabled)
config.cursor_smear = true

-- Comet gradient: tail fades to transparent (default: false = uniform opacity)
config.cursor_smear_gradient = false

-- Smear animation duration in seconds (default: 0.15)
config.cursor_animation_length = 0.150

-- Trail size: 1.0 = maximum stretch, 0.0 = no visible trail (default: 1.0)
config.cursor_trail_size = 1.0

-- Particle / highlight style; leave unset for no particles (default: nil)
config.cursor_trail_style = "PixieDust" -- or PixieDust, Railgun, SonicBoom, Ripple, Wireframe

-- Minimum cursor movement in cells before effects trigger (default: 4)
config.cursor_trail_min_distance = 4

-- Particle opacity, 1.0 = fully opaque (default: 0.6)
config.cursor_vfx_opacity = 0.6

-- How long particles persist in seconds (default: 0.35)
config.cursor_vfx_particle_lifetime = 0.35

-- Particles spawned per cell of movement (default: 0.7)
config.cursor_vfx_particle_density = 0.7

-- Initial particle speed in cells/sec (default: 8.0)
config.cursor_vfx_particle_speed = 8.0

-- Particle diameter as a fraction of cell width (default: 0.5)
config.cursor_vfx_particle_size = 0.5

config.color_scheme = "Dark Pastel"
config.enable_wayland = true
-- config.kde_window_background_blur = true
config.window_background_opacity = 0.7
-- config.text_background_opacity = 0.7

-- config.freetype_load_target = "Light"
-- config.freetype_render_target = "Light"
config.adjust_window_size_when_changing_font_size = false
config.font_thicken = true
config.font_thicken_strength = 148
-- 中英二比一测试
-- config.font = wez.font("Sarasa Term SC")
config.font = wez.font("Maple Mono")
config.font_size = 18
config.window_decorations = "NONE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 300
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.tab_bar_at_bottom = true
wez.on("format-tab-title", function(tab, tabs, panes, conf, hover, max_width)
	local active_bg = "#acccf4"
	local active_fg = "#414343"
	local inactive_bg = "#000000"
	local inactive_fg = active_fg
	local slanted = active_bg
	local tansparent = "#000000"
	if tab.is_active then
		if tab.tab_index == 0 then
			return {
				{ Background = { Color = active_bg } },
				{ Foreground = { Color = active_fg } },
				{ Text = tab.active_pane.title },
				{ Background = { Color = tansparent } },
				{ Foreground = { Color = slanted } },
				{ Text = wez.nerdfonts.ple_upper_left_triangle },
			}
		end
		return {
			{ Background = { Color = tansparent } },
			{ Foreground = { Color = slanted } },
			{ Text = wez.nerdfonts.ple_lower_right_triangle },
			{ Background = { Color = active_bg } },
			{ Foreground = { Color = active_fg } },
			{ Text = tab.active_pane.title },
			{ Background = { Color = tansparent } },
			{ Foreground = { Color = slanted } },
			{ Text = wez.nerdfonts.ple_upper_left_triangle },
		}
	else
		if tab.tab_index == 0 then
			return {
				{ Background = { Color = inactive_bg } },
				{ Foreground = { Color = inactive_fg } },
				{ Text = tab.active_pane.title },
				{ Background = { Color = tansparent } },
				{ Foreground = { Color = tansparent } },
				{ Text = wez.nerdfonts.ple_upper_left_triangle },
			}
		end
		return {
			{ Background = { Color = tansparent } },
			{ Foreground = { Color = tansparent } },
			{ Text = wez.nerdfonts.ple_lower_right_triangle },
			{ Background = { Color = inactive_bg } },
			{ Foreground = { Color = inactive_fg } },
			{ Text = tab.active_pane.title },
			{ Background = { Color = tansparent } },
			{ Foreground = { Color = tansparent } },
			{ Text = wez.nerdfonts.ple_upper_left_triangle },
		}
	end
end)

config.colors = {
	tab_bar = {
		background = "rgba(0,0,0,0)",
		inactive_tab_edge = "#000000",

		-- active_tab = {
		-- 	bg_color = "rgba(211,211,211,0)",
		-- 	fg_color = "rgba(0,222,255,1)",
		-- },
		-- inactive_tab = {
		-- 	bg_color = "rgba(0,0,0,0)",
		-- 	fg_color = "rgba(211,211,211,0.7)",
		-- },
		-- inactive_tab_hover = {
		-- 	bg_color = "rgba(1,1,1,0)",
		-- 	fg_color = "rgba(255,255,255,0.7)",
		-- 	italic = true,
		-- },
	},
}
config.alternate_buffer_wheel_scroll_speed = 2
config.enable_scroll_bar = false
-- config.enable_kitty_graphics = true
config.animation_fps = 200

config.front_end = "WebGpu"
-- config.custom_shaders = { "/home/ycna/.config/wez/shaders/cursor_warp.wgsl" }

return config
