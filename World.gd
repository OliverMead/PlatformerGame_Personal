extends Node2D

const starNum = 14

func _ready():
	set_process(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	if Input.is_action_pressed("ui_cancel") or Input.is_key_pressed(KEY_Q):
		get_tree().change_scene("res://MainMenu.tscn")
	if $Player.starCount == starNum:
		# you won
		pass
	if $Player.lives == 0:
		# you died
		pass