extends Node

func _ready():
	var window = get_window()
	var dpi = DisplayServer.screen_get_dpi()
	var pixel_size = window.get_size()
	# On MacOS Retina displays are usually DPI > 180
	if dpi > 180:
		window.set_size(Vector2i(pixel_size.x * 2, pixel_size.y * 2))
