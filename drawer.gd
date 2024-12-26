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
		shape=shape.slice(1)

func _process(_delta):
	queue_redraw()

func _draw():
	#draw lines between nodes
	for i in nodes.size()-1:
		draw_line(nodes[i].global_position,nodes[i+1].global_position,Color.DARK_BLUE)
	#draw fourrier shape
	draw_polyline(shape,Color.GREEN_YELLOW)
	# draw waveform representation
	var remapped=[]
	var origin=Whiteboard.circle_origin.position
	
	for i in shape.size():
		remapped.append(Vector2(origin.x-(shape.size()-i), shape[i].y+origin.y))
	draw_polyline(remapped,Color.ORANGE)


func reset():
	#nodes=get_nodes()
	shape=PackedVector2Array()
	shape.append(nodes[-1].global_position)
