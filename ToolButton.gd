extends ToolButton

onready var parent = get_parent()

func _ready():
	pass

func _pressed():
	#parent.get_node("AudioStreamPlayer2D").stop()
	get_tree().reload_current_scene()

#func _process(delta):
#	pass
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"): 
		parent.get_node("AudioStreamPlayer2D").stop()
		get_tree().reload_current_scene()