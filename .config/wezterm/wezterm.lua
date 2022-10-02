local wezterm = require("wezterm")

local config = {
	font_size = 13.0,
	cursor_thickness = 2.0,
	tab_bar_at_bottom = true,
	underline_thickness = 2.0,
	color_scheme = "Dark Flat",
	window_decorations = "RESIZE",
	window_background_opacity = 0.85,
	hide_tab_bar_if_only_one_tab = true,
	default_cursor_style = "SteadyUnderline",
	window_padding = { bottom = "5" },
	font = wezterm.font("Liga SFMono Nerd Font"),
}

return config
