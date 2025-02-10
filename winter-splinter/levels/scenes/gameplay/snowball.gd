extends CharacterBody2D

var speed = Constants.BALL_INIT_SPEED
var direction = Constants.BALL_INIT_VECTOR
var is_moving = false
var ball_strength = 1

func _ready():
	velocity = speed * direction
	reset_ball()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		var normal = collision.get_normal()

		# Handle collision with platform
		if "Paddle" in collider.name:
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

func _handle_platform_bounce(platform, collision_point):
	# Get the CollisionShape2D node
	var collision_shape = platform.get_node("CollisionShape2D") 
	
	# Get platform width (assuming it has a RectangleShape2D)
	var platform_width = collision_shape.shape.extents.x * 2  # `extents.x` is half-width

	# Calculate relative hit position (-1 = left, 1 = right)
	var relative_hit_position = (collision_point.x - platform.position.x) / (platform_width / 2)

	# Debugging: Print where the ball hits
	print("Collision point:", collision_point, " Platform position:", platform.position)
	print("Relative Hit Position:", relative_hit_position)

	# Convert relative hit position to an angle range
	var bounce_angle = lerp(-Constants.MAX_BOUNCE_ANGLE, Constants.MAX_BOUNCE_ANGLE, (relative_hit_position + 1) / 2)

	# Debugging: Print the bounce angle
	print("Bounce Angle (radians):", bounce_angle, " Bounce Angle (degrees):", rad_to_deg(bounce_angle))

	# Create new direction based on bounce angle
	direction = Vector2(cos(bounce_angle), -sin(bounce_angle)).normalized()
	velocity = direction * speed



func launch():
	is_moving = true

func reset_ball():
	position = Constants.BALL_POS
	direction = Constants.BALL_INIT_VECTOR
	is_moving = true

func _on_power_up_activated():
	ball_strength = 3
	
func _on_power_up_deactivated():
	ball_strength = 1
