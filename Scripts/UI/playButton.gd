extends Button
var mainScene = ""

func _ready():
	mainScene = preload("res://Scenes/Main.tscn")
	grab_focus()

func _pressed():
	get_tree().change_scene_to(mainScene)
