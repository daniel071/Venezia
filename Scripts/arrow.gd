extends Sprite

onready var pointTo = get_node("../../Giovanni")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	#set_rotation(get_node("../../Giovanni").get_position().angle_to(get_position()))
	set_rotation(get_node("../../KinematicBody2D").get_position().angle_to_point(pointTo.get_position()))
	#print(get_node("../KinematicBody2D").get_position())
