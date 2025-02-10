extends Area2D

var fall_speed: float = Constants.FALL_SPEED
var collected: bool = false

func _process(delta):
	position.y += fall_speed * delta
	if position.y > (get_viewport_rect().size.y + 50):
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("paddle"):
		collected = true
		# Apply effect: Increase score
		ScoreManager.add_points(Constants.POWERUP_POINTS)
		queue_free()
