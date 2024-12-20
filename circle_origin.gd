extends Node2D
class_name circle_origin

# Called when the node enters the scene tree for the first time.
func _ready():
	print(name)
	Whiteboard.circle_origin=self
	pass # Replace with function body.
