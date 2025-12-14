extends Node
@onready var points_label : Label = %pointslabels

var points = 0
var lives = 3

func decrease_health():
	lives -= 1
	print(lives)
	if(lives == 0):
		get_tree().reload_current_scene()

func add_point():
	points += 1
	print(points)
	points_label.text = "melons d’eau: " + str(points)
