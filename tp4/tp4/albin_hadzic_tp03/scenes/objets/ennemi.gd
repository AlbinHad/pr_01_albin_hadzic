extends RigidBody2D

@onready var game_manager = %gamemanager

func _on_area_2d_body_entered(body):
	if body.name == "CharacterBody2D":
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x

		# Stomp (par le dessus)
		if y_delta > 30:
			call_deferred("die")
			body.call_deferred("bounce_up")

		# Collision sur le côté
		else:
			game_manager.decrease_health()

			if x_delta > 0:
				body.call_deferred("jump_side", 500)
			else:
				body.call_deferred("jump_side", -500)


func die():
	queue_free()
