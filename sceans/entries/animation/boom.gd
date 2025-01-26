extends Node2D
class_name Boom

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var boom_sound: AudioStreamPlayer = $boom_sound

func _on_ready() -> void:
	timer.start()
	boom_sound.play()
	animation_player.play("Boom")


func _on_timer_timeout() -> void:
	queue_free()
