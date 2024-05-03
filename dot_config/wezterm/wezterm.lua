local wezterm = require("wezterm")

local config = {
	color_scheme = "Dark Flat",
	cursor_thickness = 2.0,
	default_cursor_style = "SteadyUnderline",
	font = wezterm.font("LigaSFMono Nerd Font", { weight = "Medium" }),
	font_size = 13.0,
	hide_tab_bar_if_only_one_tab = true,
	initial_cols = 143,
	initial_rows = 48,
	show_new_tab_button_in_tab_bar = false,
	tab_bar_at_bottom = true,
	underline_thickness = 2.0,
	window_background_opacity = 0.85,
	window_decorations = "RESIZE",
	window_padding = { bottom = "5" },
}

return config
