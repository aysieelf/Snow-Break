extends Node


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
	
func game_over_screen() -> void:
	current_state = Constants.GameState.GAME_OVER

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
