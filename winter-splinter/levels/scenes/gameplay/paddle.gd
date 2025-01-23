extends CharacterBody2D

## shouldn't go outside game screen
## should have a collision box around itself
## if game state is playing and powerup_timer is not on, should have default face
## if game state is playing and powerup_timer is on, powerup face should be visible instead, and strengthupglow should be visible
## if game state is level up, levelup face should be visible, and strengthupglow should be visible
## if game state is game over, powerup face should be visible

func _physics_process(delta):
	# Get the input direction (-1 for left, 1 for right, 0 for no input)
	var direction = Input.get_axis("move_left", "move_right")
	
	# Calculate velocity
	velocity.x = direction * Constants.PADDLE_SPEED
	
	# Apply movement
	move_and_slide()
	
	global_position.x = clamp(global_position.x, 0, get_viewport_rect().size.x)
