extends Node

signal music_volume_changed(new_volume: float)
signal sfx_volume_changed(new_volume: float)
signal music_mute_toggled(is_muted: bool)
signal sfx_mute_toggled(is_muted: bool)

var is_music_muted: bool = false
var is_sfx_muted: bool = false
var master_volume: float = Constants.MAX_MASTER_VOLUME
var sfx_volume: float = Constants.MAX_SFX_VOLUME
var music_volume: float = Constants.MAX_MUSIC_VOLUME
var sfx_players: Dictionary = {
	"brick-break": "res://assets/sounds/brick-break.wav",
	"game-over": "res://assets/sounds/game-over.wav",
	"level-up": "res://assets/sounds/level-up.wav",
	"mouse-click": "res://assets/sounds/mouse-click.wav",
	"power-up-collect": "res://assets/sounds/power-up-collect.wav",
	"snowball-bounce": "res://assets/sounds/snowball-bounce.wav",
	"snowball-out": "res://assets/sounds/snowball-out.wav",
}

var music_tracks: Array = [
	"res://assets/music/background-music1.mp3",
	"res://assets/music/background-music2.mp3"
]
var current_track_index: int = 0
var music_player: AudioStreamPlayer = null

const SETTINGS_PATH = "user://sound_settings.cfg"

var _previous_music_volume: float = music_volume
var _previous_sfx_volume: float = sfx_volume

func play_sfx(sound_name: String) -> void:
	if is_sfx_muted:
		return
		
	if sound_name in sfx_players:
		var stream = load(sfx_players[sound_name]) as AudioStream
		if stream:
			var player = AudioStreamPlayer.new()
			add_child(player)
			player.stream = stream
			player.volume_db = linear_to_db(sfx_volume * master_volume)
			player.play()
			player.finished.connect(func(): 
				player.queue_free()
			)

func play_music() -> void:
	if not music_player:
		music_player = AudioStreamPlayer.new()
		add_child(music_player)
		music_player.finished.connect(_on_music_finished)
	
	var stream = load(music_tracks[current_track_index]) as AudioStream
	if stream:
		music_player.stream = stream
		music_player.volume_db = linear_to_db(music_volume * master_volume)
		music_player.play()

func _on_music_finished() -> void:
	current_track_index = (current_track_index + 1) % music_tracks.size()
	play_music()

func set_master_volume(new_volume: float) -> void:
	master_volume = clamp(new_volume, 0.0, 1.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(master_volume))
	emit_signal("volume_changed", master_volume)

func set_sfx_volume(new_volume: float) -> void:
	sfx_volume = clamp(new_volume, 0.0, 1.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(sfx_volume))
	emit_signal("sfx_volume_changed", sfx_volume)

func set_music_volume(new_volume: float) -> void:
	music_volume = clamp(new_volume, 0.0, 1.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(music_volume))
	emit_signal("music_volume_changed", music_volume)
	
func toggle_mute_sfx() -> void:
	is_sfx_muted = !is_sfx_muted
	if is_sfx_muted:
		_previous_sfx_volume = sfx_volume
		sfx_volume = 0.0
	else:
		sfx_volume = _previous_sfx_volume
	emit_signal("sfx_mute_toggled", is_sfx_muted)
	emit_signal("sfx_volume_changed", sfx_volume)

func toggle_mute_music() -> void:
	is_music_muted = !is_music_muted
	if is_music_muted:
		_previous_music_volume = music_volume
		music_volume = 0.0
	else:
		music_volume = _previous_music_volume
	emit_signal("music_mute_toggled", is_music_muted)
	emit_signal("music_volume_changed", music_volume)
	

func load_sound_settings() -> void:
	var config = ConfigFile.new()
	if config.load(SETTINGS_PATH) == OK:
		master_volume = config.get_value("audio", "master_volume", 1.0)
		sfx_volume = config.get_value("audio", "sfx_volume", 1.0)
		music_volume = config.get_value("audio", "music_volume", 1.0)
		is_music_muted = config.get_value("audio", "is_music_muted", false)
		is_sfx_muted = config.get_value("audio", "is_sfx_muted", false)
		emit_signal("music_volume_changed", music_volume)
		emit_signal("sfx_volume_changed", sfx_volume)
		emit_signal("music_mute_toggled", is_music_muted)
		emit_signal("sfx_mute_toggled", is_sfx_muted)


func save_sound_settings() -> void:
	var config = ConfigFile.new()
	config.set_value("audio", "master_volume", master_volume)
	config.set_value("audio", "sfx_volume", sfx_volume)
	config.set_value("audio", "music_volume", music_volume)
	config.set_value("audio", "is_music_muted", is_music_muted)
	config.set_value("audio", "is_sfx_muted", is_sfx_muted)
	config.save(SETTINGS_PATH)
