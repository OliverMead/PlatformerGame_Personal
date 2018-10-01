extends KinematicBody2D

const UP = Vector2(0,-1)
const G = 30
const SPEED = 500
const JUMP_HEIGHT = 800

var motion = Vector2()


func _physics_process(delta):
	motion.y += G
		
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	
	if Input.is_action_pressed("ui_up"):
		motion.y = -SPEED
	
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		motion.y = -JUMP_HEIGHT
		
	motion = move_and_slide(motion, UP)
	pass