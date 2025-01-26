extends StaticBody2D


func _ready() -> void:
	pass

func take_damage(damage):
	$BrickBreak.emitting = true
	$BrickBreak.process_mode = Node.PROCESS_MODE_ALWAYS
	$BrickBreak.reparent(get_parent()) 
	queue_free()  
