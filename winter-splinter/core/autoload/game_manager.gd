extends Node

signal level_up_screen_activated
signal game_over_screen_activated

var current_state: Constants.GameState = Constants.GameState.MENU

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
	
func increase_ball_strength() -> void:
	# 1. change ball's strength
	# 2. show powerup in hud
	# 3. activate timer
	pass
	
