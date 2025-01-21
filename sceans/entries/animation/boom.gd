extends Node2D
class_name Boom

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

func _on_ready() -> void:
	timer.start()
	animation_player.play("Boom")


func _on_timer_timeout() -> void:
	queue_free()
