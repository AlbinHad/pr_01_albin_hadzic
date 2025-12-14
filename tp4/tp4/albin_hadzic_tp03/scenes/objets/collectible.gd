extends Area2D

@onready var game_manager: Node = %gamemanager
@onready var pickup_sound: AudioStreamPlayer2D = $pickupsound

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		
		var sound = pickup_sound
		sound.reparent(get_tree().current_scene)
		sound.play()

		
		game_manager.add_point()

		
		queue_free()
