local wez = require("wezterm")
local keys = {}

keys.bindings = {
	--  把 Ctrl+Shift+- 设为「减小字体」
	{
		key = "-",
		mods = "CTRL|SHIFT",
		action = wez.action.DecreaseFontSize,
	},

	-- 把 Ctrl+Shift+= 设为「增大字体」
	{
		key = "=",
		mods = "CTRL|SHIFT",
		action = wez.action.IncreaseFontSize,
	},

	-- 把 Ctrl+Shift+0 设为「重置字体大小」
	{
		key = "0",
		mods = "CTRL|SHIFT",
		action = wez.action.ResetFontSize,
	},

	-- 禁用默认的 Ctrl+- Ctrl+=（避免冲突)
	{
		key = "-",
		mods = "CTRL",
		action = wez.action.DisableDefaultAssignment,
	},
	{
		key = "=",
		mods = "CTRL",
		action = wez.action.DisableDefaultAssignment,
	},
}
-- keys.mouse_bindings = {
--   -- Select output of entire command when triple-clicking
--   {
--     event = { Down = { streak = 3, button = 'Left' } },
--     action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
--   },
-- }
return keys
