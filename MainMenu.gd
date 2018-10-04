extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass

func _process(delta):
	if Input.is_key_pressed(KEY_1):
		get_tree().change_scene("res://World.tscn")
	elif Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
