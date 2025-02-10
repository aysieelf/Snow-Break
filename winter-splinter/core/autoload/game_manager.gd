extends Node

signal level_up_screen_activated
signal game_over_screen_activated
signal powerup_activated()
signal powerup_ended()

var current_state: Constants.GameState = Constants.GameState.MENU
var powerup_timer: Timer

func _ready():
	powerup_timer = Timer.new()
	add_child(powerup_timer)
	powerup_timer.connect("timeout", _on_PowerUpTimer_timeout)  # Connect the timeout signal
	powerup_timer.one_shot = true
	powerup_timer.wait_time = Constants.POWERUP_TIMER


func start_game() -> void:
	current_state = Constants.GameState.PLAYING

func toggle_pause() -> void:
	if current_state == Constants.GameState.PLAYING:
		current_state = Constants.GameState.PAUSED
	elif current_state == Constants.GameState.PAUSED:
		current_state = Constants.GameState.PLAYING

func level_up_screen() -> void:
	ScoreManager.level_up()
	current_state = Constants.GameState.LEVEL_UP
	emit_signal("level_up_screen_activated")
	
func game_over_screen() -> void:
	current_state = Constants.GameState.GAME_OVER
	emit_signal("game_over_screen_activated")

func restart_current_level() -> void:
	# TODO: partly reset
	start_game()

func complete_restart() -> void:
	# TODO: reset everything
	start_game()
	
func quit_to_menu() -> void:
	current_state = Constants.GameState.MENU

func quit() -> void:
	get_tree().quit()
	
func increase_ball_strength():
	emit_signal("powerup_activated")
	print("Powerup should be activating now")
	start_powerup_timer()

func start_powerup_timer():
	powerup_timer.start()
	print("⏳ Power-up timer started!")

func _on_PowerUpTimer_timeout():
	emit_signal("powerup_ended")  # Emit signal when power-up ends
	print("💨 Power-up expired, ball strength reset to 1!")
