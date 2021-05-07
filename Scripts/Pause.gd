extends Control
var new_pause_state = false

func _input(event):
	if event.is_action_pressed("pause"):
		new_pause_state = not get_tree().paused
		visible = new_pause_state
		get_tree().paused = new_pause_state 


func _on_Pause_pressed():
	new_pause_state = false
	visible = new_pause_state
	get_tree().paused = new_pause_state 
	pass # Replace with function body.
