extends Node

@onready var points_label: Label = %pointslabels
@export var hearts: Array[Node]

var points = 0
var lives = 3
var has_key := false


func decrease_health():
	lives -= 1
	print(lives)

	for h in range(3):
		if h < lives:
			hearts[h].show()
		else:
			hearts[h].hide()

	if lives == 0:
		get_tree().reload_current_scene()


func add_point():
	points += 1
	print(points)
	points_label.text = "melons d’eau: " + str(points)

	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.global_position = Vector2(100, 100)


func give_key():
	has_key = true
	print("🔑 Clé récupérée")
