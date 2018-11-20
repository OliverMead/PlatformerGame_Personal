extends ToolButton

func _ready():
	pass

func _pressed():
	get_tree().reload_current_scene()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()