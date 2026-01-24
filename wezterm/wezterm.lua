local wezterm = require("wezterm")
local config = wezterm.config_builder()
local wez = wezterm


config.color_scheme = 'Dark Pastel'
config.enable_wayland = true
-- config.kde_window_background_blur = true
config.window_background_opacity = 0.7
config.text_background_opacity = 0.7 -- 文本背景透明度（可选）

config.window_frame = {
	font = wezterm.font(
	-- "0xProto Nerd Font Mono",
		"JetBrainsMono Nerd Font Mono", -- 主字体
		--		"FiraCode Nerd Font Mono", -- 回退
		--		"Noto Sans CJK SC", -- 中文字体
		{ weight = "Medium" }
	),
	active_titlebar_bg = "rgba(1,1,1,0.3)",
	inactive_titlebar_bg = "rgba(1,1,1,0)",
}
config.freetype_load_target = "Normal"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13
config.window_decorations = "NONE"
config.use_fancy_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,

}
--config.use_fancy_tab_bar = true
-- config.enable_tab_bar = false

-- config.dpi = 192
wezterm.on('format-tab-title', function(tab)
	local title = tab.active_pane.title or 'Shell'
	local cwd = string.match(title, ".*/(.*/.+)$") or title
	return {

		{ Text = "  " .. cwd .. " " }, -- 使用 Nerd Font 图标

	}
end)
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 300
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.tab_bar_at_bottom = true
config.colors = {
	tab_bar = {
		background = 'rgba(0,0,0,0)',

		active_tab = {
			bg_color = 'rgba(211,211,211,0)',
			-- fg_color = 'rgba(0,198,255,1)',
			fg_color = 'rgba(0,222,255,1)'
		},
		inactive_tab = {
			bg_color = 'rgba(0,0,0,0)',
			fg_color = 'rgba(211,211,211,0.7)',
		},
		inactive_tab_hover = {
			bg_color = 'rgba(1,1,1,0)',
			fg_color = 'rgba(255,255,255,0.7)',
			italic = true,
		},
		-- inactive_tab_edge = '#575757',
	},
}

config.alternate_buffer_wheel_scroll_speed = 2
config.enable_scroll_bar = true
config.enable_kitty_graphics = true
config.animation_fps = 18



config.webgpu_preferred_adapter = {
	backend = 'Vulkan',
	device = 10465,
	device_type = 'DiscreteGpu',
	driver = 'NVIDIA',
	driver_info = '580.105.08',
	name = 'NVIDIA GeForce RTX 4050 Laptop GPU',
	vendor = 4318,
}
config.front_end = 'WebGpu'

return config
