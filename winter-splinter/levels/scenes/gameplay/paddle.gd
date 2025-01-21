extends Node2D

func _process(delta):
	# Следваме само по X оста
	var target_x = get_global_mouse_position().x
	# Запазваме текущата Y позиция
	var current_y = global_position.y
	# Обновяваме позицията
	global_position = Vector2(target_x, current_y)
