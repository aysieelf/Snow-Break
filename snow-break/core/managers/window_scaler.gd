extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var window = get_window()
	var scale_factor = window.get_content_scale_factor()
	var pixel_size = window.get_size()
	if scale_factor == 2.0:
		window.set_size(Vector2i(pixel_size.x * 2, pixel_size.y * 2))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
