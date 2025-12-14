extends Area2D

@export var next_level_path: String

func _on_body_entered(body):
	if body.is_in_group("player"):
		var gm = get_tree().get_first_node_in_group("gamemanager")
		
		if gm and gm.has_key:
			get_tree().change_scene_to_file(next_level_path)
		else:
			print("🚫 Clé requise")
