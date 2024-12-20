extends Node2D
class_name drawer

var nodes:Array

var shape:PackedVector2Array

func _ready():
	Whiteboard.drawer=self
	nodes=get_nodes()
	reset()

func get_nodes():
	var result=[]
	result.append(get_node("../circle_origin"))
	while result[-1].get_children():
		var children=result[-1].get_children()
		result=result+children
	return result


func _physics_process(delta):
	shape.append(nodes[-1].global_position)
	if shape.size()>1000:
		shape=shape.slice(900)

func _process(_delta):
	queue_redraw()

func _draw():
	#draw lines between nodes
	for i in nodes.size()-1:
		draw_line(nodes[i].global_position,nodes[i+1].global_position,Color.DARK_BLUE)
	#draw fourrier shape
	for i in shape.size()-1:
		draw_polyline(shape,Color.GREEN_YELLOW)

func reset():
	#nodes=get_nodes()
	shape=PackedVector2Array()
	shape.append(nodes[-1].global_position)
