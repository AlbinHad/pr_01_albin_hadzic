extends Area2D

@export var target_position: Vector2
@export var next_scene: String = ""

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "CharacterBody2D": # ton joueur
		if next_scene != "":
			get_tree().change_scene_to_file(next_scene)
		else:
			body.global_position = target_position
