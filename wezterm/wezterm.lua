local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on('update-right-status', function(window, pane)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime '%a %b %-d %H:%M '

	local bat = ''
	for _, b in ipairs(wezterm.battery_info()) do
		bat = '🔋 ' .. string.format('%.0f%%', b.state_of_charge * 100)
	end

	window:set_right_status(wezterm.format {
		{ Text = bat .. '   ' .. date },
	})
end)

return {
	color_scheme = "tokyonight",
	-- font
	font = wezterm.font 'JetBrains Mono',
	harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
	-- opacity
	window_background_opacity = 0.85,
	-- scrollback
	scrollback_lines = 1000,
	-- cursor
	default_cursor_style = 'BlinkingBar',
	cursor_blink_rate = 500,
	animation_fps = 1,
	cursor_blink_ease_in = 'Constant',
	cursor_blink_ease_out = 'Constant',
	-- selection
	selection_word_boundary = '{}[]()"\'`.,;:',
	-- skip close confirmation
	skip_close_confirmation_for_processes_named = {
		'bash',
		'sh',
		'zsh',
		'fish',
		'tmux',
		'nu',
		'cmd.exe',
		'pwsh.exe',
		'powershell.exe',
	}
}
