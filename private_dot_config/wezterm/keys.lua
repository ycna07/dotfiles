local wez = require("wezterm")
local act = wez.action
local keys = {}

keys.bindings = {
	--  把 Ctrl+Shift+- 设为「减小字体」
	{
		key = "-",
		mods = "CTRL|SHIFT",
		action = act.DecreaseFontSize,
	},

	-- 把 Ctrl+Shift+= 设为「增大字体」
	{
		key = "=",
		mods = "CTRL|SHIFT",
		action = act.IncreaseFontSize,
	},

	-- 把 Ctrl+Shift+0 设为「重置字体大小」
	{
		key = "0",
		mods = "CTRL|SHIFT",
		action = act.ResetFontSize,
	},

	-- 禁用默认的 Ctrl+- Ctrl+=（避免冲突)
	{
		key = "-",
		mods = "CTRL",
		action = act.DisableDefaultAssignment,
	},
	{
		key = "=",
		mods = "CTRL",
		action = act.DisableDefaultAssignment,
	},
	-- Ctrl+Shift+z 回到上一个prompt
	{
		key = "z",
		mods = "CTRL|SHIFT",
		action = act.ScrollToPrompt(-1),
	},
	-- Ctrl+Shift+x 回到下一个prompt
	{
		key = "x",
		mods = "CTRL|SHIFT",
		action = act.ScrollToPrompt(1),
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
