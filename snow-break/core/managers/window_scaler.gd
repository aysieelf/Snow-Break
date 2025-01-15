extends Node

func _ready():
	var window = get_window()
	var scale_factor = window.get_content_scale_factor()
	print("Scale factor:", scale_factor)
	
	var dpi = DisplayServer.screen_get_dpi()
	print("Screen DPI:", dpi)
	
	var pixel_size = window.get_size()
	print("Current window size:", pixel_size)
	
	# На Mac Retina дисплеите обикновено са с DPI > 180
	if dpi > 180:
		window.set_size(Vector2i(pixel_size.x * 2, pixel_size.y * 2))
		print("New window size:", window.get_size())
