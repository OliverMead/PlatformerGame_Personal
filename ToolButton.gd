extends ToolButton

func _ready():
	pass

func _pressed():
	get_tree().reload_current_scene()