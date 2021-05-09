extends CheckBox

func _ready():
	grab_focus()
	pressed = get_node("/root/Music").playing

func _toggled(state):
	get_node("/root/Music").playing = state
