extends Node2D

const starNum = 1

func _ready():
	set_process(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	if Input.is_action_pressed("ui_cancel") or Input.is_key_pressed(KEY_Q):
		get_tree().change_scene("res://MainMenu.tscn")

