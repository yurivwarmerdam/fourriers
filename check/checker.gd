extends Node2D
class_name Checker

var checking:bool=false

func _ready() -> void:
	Whiteboard.checker=self

func _physics_process(delta: float) -> void:
	if checking:
		

func check():
	# TODO: disable all inputs
	checking=true
	generate_solution()
	check_solution()

func generate_solution():
	Whiteboard.reset()
	Whiteboard.set_play(true)
	Whiteboard.set_play_check(true)

func check_solution():
	pass
