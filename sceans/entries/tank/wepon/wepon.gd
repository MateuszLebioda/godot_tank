extends Node2D
class_name Weapon

enum STATES {READY, FIRING, RELOAD}

const TURN_SPEED = 1.5

var direction = Vector2.RIGHT
var state = STATES.READY

@export var BULLET_SCENE: PackedScene

@onready var reload: Timer = $Reload

signal reloaded()
signal reload_progress(progress)

func _process(delta):
	if !reload.is_stopped():
		var progress = 1 - (reload.time_left / reload.wait_time)
		reload_progress.emit(progress)

	
func make_rotation(input: float, delta: float):
	direction = direction.rotated(input * (PI / 2) * TURN_SPEED * delta)
	rotation = direction.angle()

func _changeState(_state: STATES): 
	state = _state

func fire():
	if(state == STATES.RELOAD || state == STATES.FIRING):
		return
	#fire
	_changeState(STATES.FIRING)
	# shot logic
	var bullety = BULLET_SCENE.instantiate()
	bullety.direction = Vector2.from_angle(global_rotation);
	bullety.position = global_position
	get_tree().root.add_child(bullety)
	
	_changeState(STATES.RELOAD)
	reload.start()
	

func _on_reload_timeout() -> void:
	_changeState(STATES.READY)
	reloaded.emit()
