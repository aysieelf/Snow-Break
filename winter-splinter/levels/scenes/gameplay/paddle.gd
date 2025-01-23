extends CharacterBody2D

func _ready():
	#GameManager.powerup_activated.connect(_on_powerup_activated)
	#GameManager.powerup_ended.connect(_on_powerup_deactivated)
	GameManager.level_up_screen_activated.connect(_on_level_up_screen_activated)
	GameManager.game_over_screen_activated.connect(_on_game_over_screen_activated)

	_change_paddle_face()

func _physics_process(delta):
	# Get the input direction (-1 for left, 1 for right, 0 for no input)
	var direction = Input.get_axis("move_left", "move_right")
	
	# Calculate velocity
	velocity.x = direction * Constants.PADDLE_SPEED
	
	# Apply movement
	move_and_slide()
	
	global_position.x = clamp(global_position.x, 0, Constants.WINDOW_WIDTH - Constants.PADDLE_WIDTH)

func _on_level_up_screen_activated() -> void:
	_change_paddle_face("LevelupFace")
	
func _on_game_over_screen_activated() -> void:
	_change_paddle_face("GameOverFace")
	
func _on_power_up_activated() -> void:
	_change_paddle_face("PowerupFace")
	
func _on_power_up_deactivated() -> void:
	_change_paddle_face("DefaultFace")

func _change_paddle_face(face: String = "DefaultFace") -> void:
	_hide_all_faces()
	if face == "DefaultFace":
		$DefaultFace.visible = true
	elif face == "LevelupFace":
		$LevelupFace.visible = true
		$StrengthUpGlow.visible = true
	elif face == "PowerupFace":
		$PowerupFace.visible = true
		$StrengthUpGlow.visible = true
	elif face == "GameOverFace":
		$PowerupFace.visible = true

func _hide_all_faces() -> void:
	$DefaultFace.visible = false
	$LevelupFace.visible = false
	$PowerupFace.visible = false
	$StrengthUpGlow.visible = false
