extends KinematicBody2D

const UP = Vector2(0,-1)
const G = 30
const SPEED = 350
const JUMP_HEIGHT = 800

onready var playerSprite = get_node("Sprite")

var motion = Vector2()

enum playerDirections{ left, right }
var playerDirection = right
enum playerStates{ idle, walk, jump, fall }
var playerState = idle

func _physics_process(delta):
	motion.y += G
			
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		playerDirection = right
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		playerDirection = left
	else:
		motion.x = 0
	
	#if Input.is_action_pressed("ui_up"):
	#	motion.y = -SPEED
	
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		motion.y = -JUMP_HEIGHT
	
	if motion.y < 0:
		if playerSprite.animation != "Jump":
			playerSprite.play("Jump")
	elif motion.y > 0 && not is_on_floor():
		if playerSprite.animation != "Fall":
			playerSprite.play("Fall")
	elif motion.x == 0:
		if playerSprite.animation != "Idle":
			playerSprite.play("Idle")
	else:
		playerSprite.play("Run")
	
	if playerDirection == left:
		playerSprite.flip_h = true
	else:
		playerSprite.flip_h = false
	
	motion = move_and_slide(motion, UP)
	pass