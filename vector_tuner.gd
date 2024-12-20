extends VBoxContainer
class_name vector_tuner

var circle:Circle

func _ready():
	%label.text=circle.name
	%rotation.value=circle.initial_rotation
	%length.value=circle.length

func _on_rotation_value_changed(value):
	circle.initial_rotation=value

func _on_length_value_changed(value):
	circle.length=value
