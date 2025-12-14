extends Area2D

@onready var sprite := $closed
@onready var collision := $CollisionShape2D

func _ready():
	sprite.play("closed")
	collision.disabled = true

func _process(_delta):
	if GameManager.has_key:
		sprite.play("open")
		collision.disabled = false
	else:
		sprite.play("closed")
		collision.disabled = true

func _on_body_entered(body):
	if body is CharacterBody2D and GameManager.has_key:
		get_tree().change_scene_to_file("res://scenes/levels/level_6_fin.tscn")
