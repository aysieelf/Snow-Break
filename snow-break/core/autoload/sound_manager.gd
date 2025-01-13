extends Node

signal music_volume_changed(new_volume: float)
signal sfx_volume_changed(new_volume: float)
signal music_mute_toggled(is_muted: bool)
signal sfx_mute_toggled(is_muted: bool)

var is_music_muted: bool = false
var is_sfx_muted: bool = false
var master_volume: float = $Constants.MAX_MASTER_VOLUME
var sfx_volume: float = $Constants.MAX_SFX_VOLUME
var music_volume: float = $Constants.MAX_MUSIC_VOLUME

var _previous_music_volume: float = music_volume
var _previous_sfx_volume: float = sfx_volume

func play_sfx(sound_name: String) -> void:
	# TODO: play the concrete sound
	pass
	
func play_music() -> void:
	# TODO: play the music (only one music is available)
	pass

func set_master_volume(new_volume: float) -> void:
	master_volume = min($Constants.MAX_MASTER_VOLUME, new_volume)
	emit_signal("volume_changed", master_volume)

func set_sfx_volume(new_volume: float) -> void:
	sfx_volume = min($Constants.MAX_SFX_VOLUME, new_volume)
	emit_signal("sfx_volume_changed", sfx_volume)

func set_music_volume(new_volume: float) -> void:
	music_volume = min($Constants.MAX_MUSIC_VOLUME, new_volume)
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
	# TODO: load settings
	pass

func save_sound_settings() -> void:
	# TODO: save settings
	pass
