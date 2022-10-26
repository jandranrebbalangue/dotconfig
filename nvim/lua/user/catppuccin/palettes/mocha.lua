local color_palette = {
	rosewater = "#dc8a78",
	flamingo =  "#dd7878",
	pink = "#D67AD2",
	mauve =     "#ca9ee6",
	red = "#c94f6d",
	maroon =    "#e64553",
	peach =     "#ef9f76",
	green = "#97c374",
	yellow = "#dbc074",
	teal_old =      "#81c8be",
	teal =      "#6abeb2",
	sky =       "#04a5e5",
	sapphire =  "#209fb5",
	blue = "#61afef",
	lavender =  "#7287fd",

	magenta = "#c678dd",
	cyan = "#63cdcf",
	white = "#dfdfe0",
	orange = "#F4A261",
	gray = "#2a2e36",

	text = "#CDD6F4",
	subtext1 = "#BAC2DE",
	subtext0 = "#A6ADC8",
	overlay2 = "#9399B2",
	overlay1 = "#7F849C",
	overlay0 = "#6C7086",
	surface2 = "#585B70",
	surface1 = "#45475A",
	surface0 = "#313244",

	base = "#1E1E2E",
	mantle = "#181825",
	crust = "#11111B",

	none = "NONE",
}

color_palette.diff = { -- git and native diffs
	add = "green",
	change = "#2B5B77",
	delete = "red",
	text = color_palette.blue,
	conflict = color_palette.magenta,
}

color_palette.warning = color_palette.yellow
color_palette.info = color_palette.blue
color_palette.hint = color_palette.teal
color_palette.variable = color_palette.text

return color_palette
