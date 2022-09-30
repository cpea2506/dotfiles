local wezterm = require("wezterm")

local config = {
	font_size = 13.0,
	tab_bar_at_bottom = true,
	color_scheme = "Dark Flat",
	window_decorations = "RESIZE",
	window_background_opacity = 0.85,
	hide_tab_bar_if_only_one_tab = true,
	window_padding = { left = "5px", right = "5px" },
	font = wezterm.font("Liga SFMono Nerd Font", { weight = "Bold" }),
}

return config
