extends Area2D
func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "personnage_principal":
			$"../MessageLabel".text = "Bonne aventure !"
			return
	
	$"../MessageLabel".text = ""
