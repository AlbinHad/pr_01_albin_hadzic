extends Node
@onready var points_label : Label = %pointslabels

var points = 0
var lives = 3

func decrease_health():
	lives -= 1
	print("Lives:", lives)

	if lives <= 0:
		respawn_player()

func add_point():
	points += 1
	print(points)
	points_label.text = "melons d’eau: " + str(points)
func respawn_player():
	lives = 3

	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.global_position = Vector2(100, 100)
var has_key := false
func give_key():
	has_key = true
	print("🔑 Clé récupérée")
