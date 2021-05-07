extends Button

func _pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
