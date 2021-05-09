extends Button

onready var purchasePopup = get_node("../../../../../../purchasePopup")

func _ready():
	pass # Replace with function body.

func _pressed():
	purchasePopup.hide()
