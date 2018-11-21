extends Node2D

const starNum = 10

onready var win = preload("res://Win.tscn")
onready var lose = preload("res://Loss.tscn")

var done = false

var time = 0.0
onready var display = get_node("CanvasLayer")

func _ready():
	set_process(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	if Input.is_action_pressed("ui_cancel") or Input.is_key_pressed(KEY_Q):
		$Player/AudioStreamPlayer2D.stop()
		get_tree().change_scene("res://MainMenu.tscn")
	if $Player.starCount == starNum and not done:
		# you won
		$Player/AudioStreamPlayer2D.stop()
		display.add_child(win.instance())
		$Player.disabled = true
		$CanvasLayer/ColorRect3/RichTextLabel.disabled = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		done = true
		pass
	if $Player.lives == 0 and not done:
		# you died
		$Player/AudioStreamPlayer2D.stop()
		display.add_child(lose.instance())
		$Player.disabled = true
		$CanvasLayer/ColorRect3/RichTextLabel.disabled = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#$CanvasLayer/Loss/RichTextLabel.color = 
		#$CanvasLayer/Loss/RichTextLabel.text = "YOU DIED"
		done = true
		pass
	time = $CanvasLayer/ColorRect3/RichTextLabel.time