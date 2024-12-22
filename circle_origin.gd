extends Node2D
class_name circle_origin

var circle_prototype= preload("res://circle.tscn")
var end_effector_prototype=preload("res://end_effector.tscn")

@export var num_circles:int=0

# Called when the node enters the scene tree for the first time.
func _ready():
	make_circles()
	Whiteboard.circle_origin=self

func make_circles():
	var previous = end_effector_prototype.instantiate()
	
	# TODO: This wants to be recursive 
	for i in range(num_circles-1,-1,-1):
		var new_circle=circle_prototype.instantiate()
		new_circle.add_child(previous)
		new_circle.name="circle "+str(i)
		previous=new_circle
	
	add_child(previous)
