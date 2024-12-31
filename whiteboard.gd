extends Node

@export var circle_origin:circle_origin
@export var circles:Array[Circle]=[]
@export var drawer:Node2D
@export var end_effector:Node2D
@export var checker:Checker

@export var circles_check:Array[Circle_Check]=[]
@export var end_effector_check:Node2D

@export var speed:float=.5

@export var play:bool=false: set = set_play
signal play_changed

func _ready():
	set_play(false)

func set_play(value:bool)->void:
	play=value
	for circle in circles:
		circle.set_physics_process(play)

func set_play_check(value:bool)->void:
	for circle in circles_check:
		circle.set_physics_process(value)

func reset():
	_reset_circles(circles)
	if circles_check: _reset_circles(circles_check)
	drawer.reset()

func _reset_circles(array:Array):
	for circle in array:
		circle.reset()

func check():
	checker.check()
