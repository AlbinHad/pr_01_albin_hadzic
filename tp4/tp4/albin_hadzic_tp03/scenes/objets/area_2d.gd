extends Area2D
func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "personnage_principal":
			$"../MessageLabel".text = "Bonne aventure !"
			return
	
	$"../MessageLabel".text = ""


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	print("Touched" +body.name)
	if (body.name == "CharacterBody2D"):
		get_tree().reload_current_scene()
