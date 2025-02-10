extends StaticBody2D

@export var powerup_scenes: Array[PackedScene]

func take_damage(damage):
	$BrickBreak.emitting = true
	$BrickBreak.process_mode = Node.PROCESS_MODE_ALWAYS
	$BrickBreak.reparent(get_parent())
	
	spawn_powerup()  # Try to spawn a power-up on destruction

	queue_free()

func spawn_powerup():
	if powerup_scenes.is_empty():
		return  # No power-ups assigned

	var chance = randf()  # Random float between 0.0 - 1.0
	if chance > 0.5:
		return  # Only 50% chance to spawn
	
	var random_powerup = powerup_scenes[randi() % powerup_scenes.size()]  # Pick random power-up
	var powerup_instance = random_powerup.instantiate()  # Create an instance

	powerup_instance.global_position = global_position  # Set to brick's position
	get_tree().current_scene.add_child(powerup_instance)
