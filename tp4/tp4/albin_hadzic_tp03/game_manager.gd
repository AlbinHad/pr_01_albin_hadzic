extends Node
@onready var points_label : Label = %pointslabels

var points = 0

func add_point():
	points += 1
	print(points)
	points_label.text = "melons d’eau: " + str(points)
