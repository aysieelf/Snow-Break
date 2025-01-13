extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


extends Node
class_name GameManager

# Енумерация за възможните състояния на играта
enum GameState {
	MENU,
	PLAYING,
	PAUSED,
	GAME_OVER
}

# Текущо състояние
var current_state: GameState = GameState.MENU

# Методи за управление на състоянието
func change_state(new_state: GameState) -> void:
	current_state = new_state
	# Тук ще emit-ваме сигнал за промяната, за да могат други части от играта да реагират
	
func toggle_pause() -> void:
	if current_state == GameState.PLAYING:
		change_state(GameState.PAUSED)
	elif current_state == GameState.PAUSED:
		change_state(GameState.PLAYING)

func restart() -> void:
	change_state(GameState.PLAYING)
	# Тук ще добавим ресетване на всички нужни променливи
	
func quit() -> void:
	get_tree().quit()
