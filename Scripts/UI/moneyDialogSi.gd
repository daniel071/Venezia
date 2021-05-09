extends Button

var currentMoney = 0
var galleryID = 1

var imgOne = preload("res://Sprites/Buildings/Tre Archi/trearchi1.jpg")
var imgTwo = preload("res://Sprites/Buildings/Tre Archi/trearchi2.jpg")
var imgThree = preload("res://Sprites/Buildings/Tre Archi/trearchi3.jpg")

onready var imageGallery = get_node("../../../../../../imageGallery")
onready var imageGallerySprite = get_node("../../../../../../imageGallery/Container/Sprite")
onready var moneyLabel = get_node("../../../../../../HBoxContainer/Money")
onready var purchasePopup = get_node("../../../../../../purchasePopup")

func _pressed():
	
	currentMoney = int(moneyLabel.text) - 50
	moneyLabel.text = String(currentMoney)
	
	purchasePopup.hide()
	imageGallery.show()


func _on_next_pressed():
	imageGallerySprite.set_texture(imgOne)
	galleryID = galleryID + 1
	
	if galleryID == 2:
		imageGallerySprite.set_texture(imgTwo)
	elif galleryID == 3:
		imageGallerySprite.set_texture(imgThree)
	else:
		imageGallery.hide()
	pass # Replace with function body.
