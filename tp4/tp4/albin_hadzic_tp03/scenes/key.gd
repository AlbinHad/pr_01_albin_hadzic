extends Area2D

func _on_body_entered(body):
	if body is CharacterBody2D:
		GameManager.has_key = true
		print("🔑 Clé obtenue")
		queue_free()
