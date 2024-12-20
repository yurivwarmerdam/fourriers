extends Control

var tuner_prototype:PackedScene=preload("res://vector_tuner.tscn")

func _ready():
	for circle in Whiteboard.circles:
		var new_tuner:vector_tuner=tuner_prototype.instantiate()
		new_tuner.circle=circle
		%tuners.add_child(new_tuner)
	pass

func _on_start_button_down():
	Whiteboard.play=true

func _on_stop_button_down():
	Whiteboard.play=false

func _on_reset_button_down():
	Whiteboard.reset()
