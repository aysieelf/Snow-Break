extends Node2D

func _ready():
	_on_power_up_deactivated()
	GameManager.connect("powerup_activated", _on_power_up_activated)
	GameManager.connect("powerup_ended", _on_power_up_deactivated)

func _process(delta: float) -> void:
	if $Timer.time_left > 0:
		$TimerLabel.text = str(int($Timer.time_left)) + " sec"


func _on_power_up_activated() -> void:
	$Icon.visible = true
	$Timer.start()
	$TimerLabel.visible = true
	

func _on_power_up_deactivated() -> void:
	$Icon.visible = false
	$TimerLabel.visible = false
