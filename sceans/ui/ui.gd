extends CanvasLayer
class_name UI

@onready var score_label: Label = %Score
@onready var reload_progress: TextureProgressBar = %ReloadProgress
@onready var MUSIC_BUS_ID = AudioServer.get_bus_index("Music");
@onready var SFX_BUS_ID = AudioServer.get_bus_index("SFX");
@onready var menu: Control = %menu

var score = 0:
	set(_score):
		score = _score
		_update_score()

func _ready() -> void:
	_update_score()

func _update_score():
	score_label.text = str(score)

func _on_collected(collactable):
	if collactable:
		score += 100
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toogle_menu"):
		menu.visible = !menu.visible

func _on_reloaded():
	reload_progress.value = 1
	
func _on_reload_progress(progress):
	reload_progress.value = progress

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MUSIC_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS_ID, value < .05)


func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS_ID, value < .05)
