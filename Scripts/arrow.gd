extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	#set_rotation(get_node("../../Giovanni").get_position().angle_to(get_position()))
	set_rotation(get_node("../../KinematicBody2D").get_position().angle_to_point(get_node("../../Giovanni").get_position()))
	#print(get_node("../KinematicBody2D").get_position())
