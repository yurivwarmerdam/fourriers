extends Node2D
class_name Circle_Check

@export var initial_rotation:float : set=set_initial_rotation
@onready  var child=get_child(-1)
@export var length=0 : set=set_length

var rotation_speed=.5

@onready var parent=get_parent()

func _ready():
	child.position=Vector2(length,0)
	reset()
	set_physics_process(false)

func _physics_process(delta):
	rotation=rotation+(delta*rotation_speed*TAU)
	#position=position.rotated(rotation_speed*delta)

func reset():
	#rotation=randf()*TAU
	rotation=initial_rotation

func set_initial_rotation(new_rotation):
	initial_rotation=new_rotation
	rotation=initial_rotation

func set_length(new_length):
	length=new_length
	if child: child.position=Vector2(length,0)
