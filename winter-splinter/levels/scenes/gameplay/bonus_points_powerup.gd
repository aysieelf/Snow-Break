extends Area2D

var fall_speed: float = int(Constants.FALL_SPEED + ScoreManager.current_level*10)
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
		SoundManager.play_sfx("power-up-collect")
		collected = true
		ScoreManager.add_points(5)
		queue_free()
