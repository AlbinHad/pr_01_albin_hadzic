extends Area2D

@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.play()

func _on_body_entered(body):
	if body is CharacterBody2D:
		body.SPEED += 150
		queue_free()
