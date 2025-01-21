extends Node2D
class_name Game

@export var tank: Tank
@export var ui: UI

func _ready() -> void:
	if !tank.point_collacted.is_connected(ui._on_collected):
		tank.point_collacted.connect(ui._on_collected)
	if !tank.reloaded.is_connected(ui._on_reloaded):
		tank.reloaded.connect(ui._on_reloaded)
	if !tank.reload_progress.is_connected(ui._on_reload_progress):
		tank.reload_progress.connect(ui._on_reload_progress)
