extends Area2D

@onready var collision = $CollisionShape2D

func _ready():
	collision.disabled = true
	print("🟣 portail prêt")

func _process(delta):
	if GameManager.has_key:
		collision.disabled = false

func _on_body_entered(body):
	print("👤 touché par :", body.name)

	if body is CharacterBody2D and GameManager.has_key:
		print("🚪 TELEPORTATION")
		get_tree().change_scene_to_file("res://scenes/levels/level_6_fin.tscn")
