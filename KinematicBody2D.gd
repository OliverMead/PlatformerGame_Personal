extends KinematicBody2D

const UP = Vector2(0,-1)
const G = 30
const SPEED = 400
const JUMP_HEIGHT = 800
const MAX_FALL_V = 70
const FLOAT_RANGE = 100
const STAR_TOTAL = 14

var starCount = 0
var lives = 3

onready var playerSprite = get_node("Sprite")
onready var world = self.get_parent()

var motion = Vector2()

enum playerDirections{ left, right }
var playerDirection = playerDirections.right
enum playerStates{ idle, run, jump, fall, floating }
var playerState = playerStates.idle
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
			playerState = playerStates.floating
	elif motion.y < 0:
		#jumping
		if playerSprite.animation != "Jump":
			playerSprite.play("Jump")
			playerState = playerStates.jump
	elif motion.y > 0 && not is_on_floor():
		#falling
		#if playerSprite.animation != "Fall" && floatCounter > MAX_FLOAT_COUNT:
		if playerSprite.animation != "Fall":
			playerSprite.play("Fall")
			playerState = playerStates.fall
			#print(motion.y)
	elif motion.x == 0:
		#idle
		if playerSprite.animation != "Idle":
			playerSprite.play("Idle")
			playerState = playerStates.idle
	else:
		#running
		if not is_analogue_input:
			playerSprite.frames.set_animation_speed("Run", 15)
		else:
			playerSprite.frames.set_animation_speed("Run", round(15 * (abs(motion.x) / SPEED)))
		playerSprite.play("Run")
		playerState = playerStates.run
	
	#set direction
	if playerDirection == playerDirections.left:
		playerSprite.flip_h = true
	else:
		playerSprite.flip_h = false

func _physics_process(delta):
	# apply gravity
	motion.y += G
			
	if Input.is_action_pressed("ui_right"):
		# set to move right with button
		motion.x = SPEED
		playerDirection = playerDirections.right
		is_analogue_input = false
	elif Input.is_action_pressed("ui_left"):
		# set to move left with button
		motion.x = -SPEED
		playerDirection = playerDirections.left
		is_analogue_input = false
	elif Input.is_action_pressed("ls_right"):
		# set to move right with stick
		motion.x = SPEED * Input.get_action_strength("ls_right")
		playerDirection = playerDirections.right
		is_analogue_input = true
	elif Input.is_action_pressed("ls_left"):
		# set to move left with stick
		motion.x = -SPEED * Input.get_action_strength("ls_left")
		playerDirection = playerDirections.left
		is_analogue_input = true
	else:
		# not moving left or right
		motion.x = 0
	
	#if Input.is_action_pressed("ui_up"):
	#	# fly mode
	#	motion.y = -SPEED
	
	if Input.is_action_pressed("ui_jump") and is_on_floor():
		jump()
	
	# process the motion of the player
	handleMotion()
	motion = move_and_slide(motion, UP)

#func _on_colliion_with_body(body):