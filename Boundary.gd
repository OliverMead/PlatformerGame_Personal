extends Sprite

func _ready():
	$Area2D.connect("body_entered", self, "hit")
	pass

func hit(object):
	if object.get("lives") != null:
		print("collision")
		object.lives = 0
	else:
		pass
	pass