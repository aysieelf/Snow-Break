extends Node

@warning_ignore("unused_signal")
signal score_changed(new_score)
@warning_ignore("unused_signal")
signal high_score_changed(high_scores)

var current_score: int = Constants.INITIAL_SCORE
var current_level: int = Constants.INITIAL_LEVEL
var current_healthbar: int = Constants.INITIAL_HEALTHBAR
var top_scores: Array[int] = []

func decrease_healthbar() -> int:
	current_healthbar -= 1
	return current_healthbar

func add_points(points: int) -> void:
	current_score += points
	emit_signal("score_changed", current_score)

func reset_score() -> void:
	current_score = 0
	emit_signal("score_changed", current_score)

func update_high_scores(new_score: int) -> void:
	if len(top_scores) < $Constants.MAX_TOP_SCORES:
		top_scores.append(new_score)
		top_scores.sort_custom(func(a, b): return a > b)
		return

	if new_score < top_scores[-1]:
		return
	
	for i in range(len(top_scores)):
		if top_scores[i] < new_score:
			top_scores.insert(i, new_score)
			top_scores.pop_back()
			emit_signal("high_score_changed", top_scores)
			break
	
func level_up():
	current_level += 1

func save_high_scores():
	pass
	
func load_high_scores():
	pass
