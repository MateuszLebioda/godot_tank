extends RigidBody2D
class_name Chest

@export var boom: PackedScene
@export var point: PackedScene

@onready var boom_soud: AudioStreamPlayer = $boom

func destroy():
	_sprawn_point()
	_destroy_animation()
	queue_free()
	

func _destroy_animation():
	var b = boom.instantiate()
	b.position = global_position
	get_tree().root.add_child(b)
	
func _sprawn_point():
	var p = point.instantiate()
	p.position = global_position
	get_tree().root.add_child(p)
