extends Area2D

var fall_speed: float = Constants.FALL_SPEED
var collected: bool = false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _process(delta):
	position.y += fall_speed * delta
	if position.y > (get_viewport_rect().size.y + 50):
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("paddle"):
		$PowerupBreak.emitting = true
		$PowerupBreak.process_mode = Node.PROCESS_MODE_ALWAYS
		$PowerupBreak.reparent(get_parent()) 
		collected = true
		GameManager.increase_ball_strength()
		ScoreManager.add_points(2)
		queue_free()
