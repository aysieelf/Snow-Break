extends CharacterBody2D

var speed = int(Constants.BALL_INIT_SPEED + ScoreManager.current_level*10)
var direction = Constants.BALL_INIT_VECTOR
var is_moving = false
var ball_strength: int = 1

func _ready():
	print("Snowball _ready() called!")
	GameManager.connect("powerup_activated", _on_power_up_activated)
	GameManager.connect("powerup_ended", _on_power_up_deactivated)
	print("Initial ball strength: ", ball_strength)  # Check the initial ball strength
	velocity = speed * direction
	
	reset_ball()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		var normal = collision.get_normal()

		# Handle collision with platform
		if "Paddle" in collider.name:
			SoundManager.play_sfx("snowball-bounce")
			_handle_platform_bounce(collider, collision.get_position())

		# Handle collision with bricks
		elif "Brick" in collider.name:
			collider.take_damage(ball_strength)
			velocity = velocity.bounce(normal).normalized() * speed

		# Handle wall bounces (clamping angles)
		else:
			var new_direction = velocity.bounce(normal).normalized()
			var angle = abs(new_direction.angle())
			if angle < Constants.MIN_BOUNCE_ANGLE or angle > PI - Constants.MIN_BOUNCE_ANGLE:
				new_direction = Vector2(new_direction.x, sign(new_direction.y) * sin(Constants.MIN_BOUNCE_ANGLE)).normalized()
			velocity = new_direction * speed
	
	if position.y > Constants.WINDOW_HEIGHT:
		snowball_out()

func _handle_platform_bounce(platform, collision_point):
	var collision_shape = platform.get_node("CollisionShape2D") 
	var platform_width = collision_shape.shape.extents.x * 2 * platform.scale.x  

	# Left edge is already platform.position.x
	var platform_left = platform.position.x
	var platform_right = platform_left + platform_width  

	# Compute correct relative hit position
	var relative_hit_position = ((collision_point.x - platform_left) / platform_width) * 2 - 1

	# Clamp to avoid values outside -1 to 1
	relative_hit_position = clamp(relative_hit_position * 1.3, -1.0, 1.0)

	# Ensure smooth angle transitions
	var max_bounce_angle = deg_to_rad(50)
	var bounce_angle = relative_hit_position * max_bounce_angle

	# Prevent too shallow angles, but allow proper flipping
	var min_angle = deg_to_rad(10)  # Minimum 10° bounce
	if abs(bounce_angle) < min_angle:
		bounce_angle = sign(bounce_angle) * min_angle  # Ensure at least 10 degrees

	# Flip X direction if it was moving left
	var new_direction = Vector2(sin(bounce_angle) * 0.8, -cos(bounce_angle)).normalized()
	if relative_hit_position < 0:
		new_direction.x = -abs(new_direction.x)  # Force it to move left when needed

	# Prevent platform sliding
	if new_direction.y > -0.1:  
		new_direction.y = -0.2  
		new_direction = new_direction.normalized()

	# Keep ball speed constant
	velocity = new_direction * speed

func snowball_out() -> void:
	SoundManager.play_sfx("snowball-out")
	reset_ball()
	var health = ScoreManager.decrease_healthbar()
	if health < 0:
		GameManager.game_over_screen()

func launch():
	is_moving = true

func reset_ball():
	position = Constants.BALL_POS
	direction = Constants.BALL_INIT_VECTOR
	velocity = speed * direction
	is_moving = true

func _on_power_up_activated():
	ball_strength = 3
	
func _on_power_up_deactivated():
	ball_strength = 1
