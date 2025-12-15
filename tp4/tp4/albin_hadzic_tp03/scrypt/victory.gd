extends Control

func _on_button_pressed():
	print("PRESSED OK")
	get_tree().paused = false
	get_tree().call_deferred(
		"change_scene_to_file",
		"res://scenes/menu/main_menu.tscn"
	)

func _on_button_2_pressed():
	print("CREDITS OK")
	get_tree().paused = false
	get_tree().call_deferred(
		"change_scene_to_file",
		"res://scenes/menu/credit.tscn"
	)
