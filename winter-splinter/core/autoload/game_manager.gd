extends Node

enum GameStates {
	MENU,
	PLAYING,
	PAUSED,
	GAME_OVER,
}

var current_state: GameStates = GameStates.MENU

func change_state(new_state: GameStates) -> void:
	current_state = new_state
	# TODO: implement logic for each state here

func toggle_pause() -> void:
	if current_state == GameStates.PLAYING:
		change_state(GameStates.PAUSED)
	elif current_state == GameStates.PAUSED:
		change_state(GameStates.PLAYING)

func restart() -> void:
	change_state(GameStates.PLAYING)
	# TODO: reset
	
func quit() -> void:
	get_tree().quit()
