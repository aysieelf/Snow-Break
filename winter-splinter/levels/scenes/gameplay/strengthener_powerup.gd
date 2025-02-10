extends Area2D

var fall_speed: float = Constants.FALL_SPEED
var collected: bool = false

func _process(delta):
	position.y += fall_speed * delta

func _on_body_entered(body):
	if body.is_in_group("paddle"):
		collected = true
		# Apply effect: Increase ball strength
		GameManager.increase_ball_strength()
		queue_free()
