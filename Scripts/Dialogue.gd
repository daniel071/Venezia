extends Control

onready var textLabel = get_node("MarginContainer/HBoxContainer/VBoxContainer/MarginContainer/Text")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func arr_join(arr, separator = ""):
	var output = "";
	for s in arr:
		output += str(s) + separator
	output = output.left( output.length() - separator.length() )
	return output

# Called when the node enters the scene tree for the first time.
func _ready():

	var textString = "Ciao! Mi chiamo Marko."
	var textList = []
	var complete = ""

	for i in textString:
		textList.append(i)
		complete = arr_join(textList, "")
		textLabel.text = complete
	
		yield(get_tree().create_timer(0.1), "timeout")
		
		
