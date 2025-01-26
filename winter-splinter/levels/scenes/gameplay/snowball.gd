extends CharacterBody2D

var speed = Constants.BALL_INIT_SPEED
var direction = Constants.BALL_INIT_VECTOR
var is_moving = false
var ball_strength = 1

func _ready():
	#GameManager.powerup_activated.connect(_on_powerup_activated)
	#GameManager.powerup_ended.connect(_on_powerup_deactivated)
	velocity = speed * direction
	
	reset_ball()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if "Brick" in collider.name:
			collider.take_damage(ball_strength)
		velocity = velocity.bounce(collision.get_normal())

func launch():
	is_moving = true

func reset_ball():
	position = Constants.BALL_POS
	direction = Constants.BALL_INIT_VECTOR
	is_moving = true

func _on_power_up_activated() -> void:
	ball_strength = 3
	
func _on_power_up_deactivated() -> void:
	ball_strength = 1
