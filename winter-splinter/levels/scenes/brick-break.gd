extends Area2D

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			# Намираме particle system нода чрез Sprite2D
			var particles = $BreakBrick
			# Стартираме частиците
			# particles.emitting = true
			# Скриваме спрайта (не целия Area2D)
			$NormalBrick.visible = false
			# Изчакваме частиците да приключат преди да премахнем нода
			await get_tree().create_timer(particles.lifetime).timeout
			# Премахваме целия Area2D (който ще премахне и децата му)
			queue_free()
