extends Button


func _ready():
	grab_focus()

func _pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")
