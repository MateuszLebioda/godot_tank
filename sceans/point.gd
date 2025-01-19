extends Area2D
class_name Point

func _on_body_entered(body: Node2D) -> void:
	if body is Tank:
		queue_free()
