local wezterm = require("wezterm")

return {
	font = wezterm.font("Liga SFMono Nerd Font", { weight = "Bold" }),
	window_background_opacity = 0.85,
	window_decorations = "RESIZE",
	color_scheme = "Dark Flat",
	hide_tab_bar_if_only_one_tab = true,
	font_size = 13.0,
	tab_bar_at_bottom = true,
	window_padding = {
		left = "5px",
		right = "5px",
	},
}
