extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		var gm = get_tree().get_first_node_in_group("gamemanager")
		if gm:
			gm.has_key = true
			print("🔑 Clé récupérée")
		queue_free()
