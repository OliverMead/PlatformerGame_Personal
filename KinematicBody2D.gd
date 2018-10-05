extends KinematicBody2D

const UP = Vector2(0,-1)
const G = 30
const SPEED = 400
const JUMP_HEIGHT = 800
const MAX_FALL_V = 70
const FLOAT_RANGE = 100

onready var playerSprite = get_node("Sprite")

var motion = Vector2()

enum playerDirections{ left, right }
var playerDirection = right
enum playerStates{ idle, run, jump, fall, floating}
var playerState = idle
var is_analogue_input = false

func jump():
	motion.y = - JUMP_HEIGHT

func die():
	pass

func handleMotion():
	if motion.y > -FLOAT_RANGE && motion.y < FLOAT_RANGE && not is_on_floor():
		#floating
		if playerSprite.animation != "Floating":
			playerSprite.play("Floating")
			playerState = floating
	elif motion.y < 0:
		#jumping
		if playerSprite.animation != "Jump":
			playerSprite.play("Jump")
			playerState = jump
	elif motion.y > 0 && not is_on_floor():
		#falling
		#if playerSprite.animation != "Fall" && floatCounter > MAX_FLOAT_COUNT:
		if playerSprite.animation != "Fall":
			playerSprite.play("Fall")
			playerState = fall
			#print(motion.y)
	elif motion.x == 0:
		#idle
		if playerSprite.animation != "Idle":
			playerSprite.play("Idle")
			playerState = idle
	else:
		#running
		if not is_analogue_input:
			playerSprite.play("Run")
			playerState = run
		else:
			playerSprite.play("Run")
			playerSprite.frames.set_animation_speed("Run", 15 * (abs(motion.x) / 400))
		
	if playerDirection == left:
		playerSprite.flip_h = true
	else:
		playerSprite.flip_h = false

func _physics_process(delta):
	motion.y += G
			
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		playerDirection = right
		is_analogue_input = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		playerDirection = left
		is_analogue_input = false
	elif Input.is_action_pressed("ls_right"):
		motion.x = SPEED * Input.get_action_strength("ls_right")
		playerDirection = right
		is_analogue_input = true
	elif Input.is_action_pressed("ls_left"):
		motion.x = -SPEED * Input.get_action_strength("ls_left")
		playerDirection = left
		is_analogue_input = true
	else:
		motion.x = 0
	
	#if Input.is_action_pressed("ui_up"):
	#	motion.y = -SPEED
	
	if Input.is_action_pressed("ui_jump") and is_on_floor():
		jump()
	
	handleMotion()
	
	motion = move_and_slide(motion, UP)
	pass