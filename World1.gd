extends Node2D

const starNum = 14

onready var win = preload("res://Win.tscn")
onready var lose = preload("res://Loss.tscn")

var time = 0.0
onready var display = get_node("CanvasLayer")

func _ready():
	set_process(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	if Input.is_action_pressed("ui_cancel") or Input.is_key_pressed(KEY_Q):
		get_tree().change_scene("res://MainMenu.tscn")
	if $Player.starCount == starNum:
		# you won
		display.add_child(win.instance())
		$Player.disabled = true
		$CanvasLayer/ColorRect3/RichTextLabel.disabled = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pass
	if $Player.lives == 0:
		# you died
		display.add_child(lose.instance())
		$Player.disabled = true
		$CanvasLayer/ColorRect3/RichTextLabel.disabled = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#$CanvasLayer/Loss/RichTextLabel.color = 
		#$CanvasLayer/Loss/RichTextLabel.text = "YOU DIED"
		pass
	time = $CanvasLayer/ColorRect3/RichTextLabel.time