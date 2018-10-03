extends KinematicBody2D

const UP = Vector2(0,-1)
const G = 30
const SPEED = 400
const JUMP_HEIGHT = 800
const MAX_FALL_V = 70

onready var playerSprite = get_node("Sprite")

var motion = Vector2()

enum playerDirections{ left, right }
var playerDirection = right
enum playerStates{ idle, run, jump, fall }
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
		#jumping
		if playerSprite.animation != "Jump":
			playerSprite.play("Jump")
			playerState = jump
	elif motion.y > 0 && not is_on_floor():
		#falling
		if playerSprite.animation != "Fall":
			playerSprite.play("Fall")
			playerState = fall
			print(motion.y)
	elif motion.x == 0:
		#idle
		if playerSprite.animation != "Idle":
			playerSprite.play("Idle")
			playerState = idle
	else:
		#running
		playerSprite.play("Run")
		playerState = run
	
	if playerDirection == left:
		playerSprite.flip_h = true
	else:
		playerSprite.flip_h = false
	
	motion = move_and_slide(motion, UP)
	pass