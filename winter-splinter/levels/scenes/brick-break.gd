extends Sprite2D  # или Node2D, според това какъв нод използваш за тухличката

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			# Намираме particle system нода (предполагам че е дете на тухличката)
			var particles = $BreakBrick
			# Стартираме частиците
			particles.emitting = true
			# Скриваме тухличката
			visible = false
			# Изчакваме частиците да приключат преди да премахнем нода
			await get_tree().create_timer(particles.lifetime).timeout
			# Премахваме тухличката от сцената
			queue_free()
