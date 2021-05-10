extends Control

var canInteract = false
var canOpenDialog = false
var shouldContinue = false
var giovanniInteracted = false
var giovanniSprite = preload("res://Sprites/Characters/Giovanni/closeup.png")
var markoSprite = preload("res://Sprites/Characters/Marko/closeup.png")
var trearchiSprite = preload("res://Sprites/Buildings/Tre Archi.png")
var currentMoney = 20

onready var textLabel = get_node("MarginContainer/HBoxContainer/VBoxContainer/MarginContainer/Text")
onready var continueLabel = get_node("MarginContainer/HBoxContainer/VBoxContainer/MarginContainer/Continue")
onready var moneyLabel = get_node("../HBoxContainer/Money")
onready var profileSprite = get_node("MarginContainer/HBoxContainer/VBoxContainer2/Sprite")
onready var arrowPointer = get_node("../../KinematicBody2D/arrow")
onready var purchasePopup = get_node("../purchasePopup")
# onready var imageGallery = get_node("../imageGallery/Sprite")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func arr_join(arr, separator = ""):
	var output = "";
	for s in arr:
		output += str(s) + separator
	output = output.left( output.length() - separator.length() )
	return output


func _print_text(textString):
	canInteract = false
	var textList = []
	var complete = ""

	continueLabel.hide()
	
	for i in textString:
		textList.append(i)
		complete = arr_join(textList, "")
		textLabel.text = complete
	
		yield(get_tree().create_timer(0.05), "timeout")
		
	continueLabel.show()
	canInteract = true


func _input(event):
	if event.is_action_pressed("interact") and canInteract == true:
		shouldContinue = true


func _ready():
	show()
	
	_print_text("Ciao! Mi chiamo Marko! Benvenuto in Venezia! Io sono tuo guida!")
	
	while shouldContinue == false:
		yield(get_tree().create_timer(0.25), "timeout")
	shouldContinue = false
	
	_print_text("Io lavoro come capocuoco in Ristorante Due Fratelli.")
	
	while shouldContinue == false:
		yield(get_tree().create_timer(0.25), "timeout")
	shouldContinue = false
	
	#_print_text("You need to find a job in order to earn money. Once you've got money, you can spend it on lots of things!")
	_print_text("Trovi i lavori a guadagnare soldi e poi usi di ristoranti e più!")
	
	while shouldContinue == false:
		yield(get_tree().create_timer(0.25), "timeout")
	shouldContinue = false
	
	_print_text("Andi Nord-Ovest, ci sono i lavori.")
	
	while shouldContinue == false:
		yield(get_tree().create_timer(0.25), "timeout")
	shouldContinue = false
	
	_print_text("Premi WASD tasti spostare.")
	
	while shouldContinue == false:
		yield(get_tree().create_timer(0.25), "timeout")
	shouldContinue = false
	
	_print_text("Premi 'SHIFT' tasti andare più veloce.")
	
	while shouldContinue == false:
		yield(get_tree().create_timer(0.25), "timeout")
	shouldContinue = false
	
	
	arrowPointer.show()
	hide()
	canOpenDialog = true


func _giovanno_introduction(area):
	if canOpenDialog == true:
		canOpenDialog = false
		arrowPointer.hide()
		profileSprite.set_texture(giovanniSprite)
		show()
		
		if giovanniInteracted == true:
			_print_text("Seguire la freccia.")
		else:
			_print_text("Buongiorno! Mi chiamo Giovanno! Io sono direttore di San Giuliano Venice.")
			
			while shouldContinue == false:
				yield(get_tree().create_timer(0.25), "timeout")
			shouldContinue = false
			
			_print_text("Bisogniamo dipendente nuovo, tu sarai perfetto!")
			
			while shouldContinue == false:
				yield(get_tree().create_timer(0.25), "timeout")
			shouldContinue = false
			
			_print_text("Hai €100, io dare più tardi.")
			
			while shouldContinue == false:
				yield(get_tree().create_timer(0.25), "timeout")
			shouldContinue = false
			
			currentMoney = int(moneyLabel.text) + 100
			moneyLabel.text = String(currentMoney)
			
			hide()
			
			yield(get_tree().create_timer(4), "timeout")
			
			
			profileSprite.set_texture(markoSprite)
			show()
			# "Checkout one fantastic restaruant, it's fantastic!"
			_print_text("Dovresti controlli un ristorante, è fantastico!")
			
			while shouldContinue == false:
				yield(get_tree().create_timer(0.25), "timeout")
			shouldContinue = false
			
			# "Follow the arrow"
			_print_text("Seguire la freccia.")
			
			giovanniInteracted = true
		
		while shouldContinue == false:
			yield(get_tree().create_timer(0.25), "timeout")
		shouldContinue = false
		
		arrowPointer.pointTo = get_node("../../TreArchi")
		arrowPointer.show()
		hide()
		
		canOpenDialog = true
	

func _on_trearchi_enter(area):
	if canOpenDialog == true:
		if int(moneyLabel.text) > 49:
			arrowPointer.hide()
			purchasePopup.show()
			
		else:
			profileSprite.set_texture(trearchiSprite)
			canOpenDialog = false
			show()
			_print_text("Scusa, ma hai bisogni €50 entrare.")
			
			while shouldContinue == false:
				yield(get_tree().create_timer(0.25), "timeout")
			shouldContinue = false
			
			hide()
			canOpenDialog = true
