extends Node2D
class_name Checker

var checking:bool=false
var check_progress=0.0

func _ready() -> void:
	Whiteboard.checker=self


func _physics_process(delta: float) -> void:
	if checking:
		
		
		check_progress+=delta
		if check_progress > (1/Whiteboard.speed)*TAU:
			stop_checking()
			check_solution()
		pass

func check():
	# TODO: disable all inputs
	checking=true
	generate_solution()
	check_solution()

func generate_solution():
	Whiteboard.reset()
	Whiteboard.set_play(true)
	Whiteboard.set_play_check(true)

func stop_checking():
	
	checking=false
	Whiteboard.set_play(false)
	Whiteboard.set_play_check(false)

func check_solution():
	pass
