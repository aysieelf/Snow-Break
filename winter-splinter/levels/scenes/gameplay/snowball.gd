extends CharacterBody2D

var speed = Constants.BALL_INIT_SPEED
var direction = Constants.BALL_INIT_VECTOR
var is_moving = false


func _ready():
	reset_ball()

func _physics_process(delta):
	if is_moving:
		velocity = direction * speed
		move_and_slide()

func launch():
	is_moving = true

func reset_ball():
	position = Constants.BALL_POS
	is_moving = false
	direction = Constants.BALL_INIT_VECTOR
