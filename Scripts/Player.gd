extends KinematicBody2D

export (int) var speed = 200
onready var _animated_sprite = get_node("Sprite")


var velocity = Vector2()

func get_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("sprint"):
		speed = 400
	else:
		speed = 200
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1


	if Input.is_action_pressed("right"):
		_animated_sprite.set_flip_h(false)
		_animated_sprite.play("default")
	elif Input.is_action_pressed("left"):
		_animated_sprite.set_flip_h(true)
		_animated_sprite.play("default")
	elif Input.is_action_pressed("down"):
		_animated_sprite.play("downanim")
	elif Input.is_action_pressed("up"):
		_animated_sprite.play("upanim")
	else:
		_animated_sprite.stop()
		
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
