extends Area2D

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var particles = $BreakBrick  # вече е директно под Area2D
			particles.emitting = true
			$NormalBrick1.visible = false
			await get_tree().create_timer(particles.lifetime).timeout
			queue_free()
