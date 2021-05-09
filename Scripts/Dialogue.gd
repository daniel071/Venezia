extends Control

var shouldContinue = false
var giovanniSprite = preload("res://Sprites/Characters/Giovanni/closeup.png")
var markoSprite = preload("res://Sprites/Characters/Marko/closeup.png")
var currentMoney = 20

onready var textLabel = get_node("MarginContainer/HBoxContainer/VBoxContainer/MarginContainer/Text")
onready var continueLabel = get_node("MarginContainer/HBoxContainer/VBoxContainer/MarginContainer/Continue")
onready var moneyLabel = get_node("../HBoxContainer/Money")
onready var profileSprite = get_node("MarginContainer/HBoxContainer/VBoxContainer2/Sprite")
onready var arrowPointer = get_node("../../KinematicBody2D/arrow")


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
	var textList = []
	var complete = ""

	continueLabel.hide()
	
	for i in textString:
		textList.append(i)
		complete = arr_join(textList, "")
		textLabel.text = complete
	
		yield(get_tree().create_timer(0.05), "timeout")
		
	continueLabel.show()


func _input(event):
	if event.is_action_pressed("interact"):
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
	
	
	arrowPointer.show()
	hide()


func _giovanno_introduction(area):
	arrowPointer.hide()
	profileSprite.set_texture(giovanniSprite)
	show()
	
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
