extends GridContainer

var normal = preload("res://levels/scenes/gameplay/brick.tscn")
var powerup = preload("res://levels/scenes/gameplay/powerup_brick.tscn")
var strong = preload("res://levels/scenes/gameplay/strong_brick.tscn")

func _ready():
	load_level(ScoreManager.current_level)
	
func load_level(level_number: int):
	# Load JSON file
	var json_path = "res://levels/data/level_" + str(level_number) + ".json"
	print(json_path)
	var file = FileAccess.open(json_path, FileAccess.READ)
	var json_text = file.get_as_text()
	var json_data = JSON.parse_string(json_text)
	
	var level_data = json_data["level_" + str(level_number)]
	
	for row in level_data.rows:
		for cell in row:
			if cell == "N":
				var normal_brick = normal.instantiate()
				add_child(normal_brick)
			elif cell == "P":
				var powerup_brick = powerup.instantiate()
				add_child(powerup_brick)
			elif cell == "S":
				var strong_brick = strong.instantiate()
				add_child(strong_brick)
