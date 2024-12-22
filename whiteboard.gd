extends Node

@export var circle_origin:circle_origin
@export var circles:Array[Circle]=[]
@export var drawer:Node2D
@export var end_effector:Node2D

@export var circles_check:Array[Circle_Check]=[]
@export var end_effector_check:Node2D

@export var play:bool=false: set = set_play
signal play_changed

func _ready():
	set_play(false)

func set_play(value:bool)->void:
	play=value
	for circle in circles:
		circle.set_physics_process(play)

func reset():
	for circle in Whiteboard.circles:
		circle.reset()
		pass
	drawer.reset()

func add_circle():
	
	pass
