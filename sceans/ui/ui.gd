extends CanvasLayer
class_name UI

@onready var score_label: Label = %Score
@onready var reload_progress: TextureProgressBar = %ReloadProgress

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
		

func _on_reloaded():
	reload_progress.value = 1
	
func _on_reload_progress(progress):
	reload_progress.value = progress
