extends Sprite

onready var world = get_parent()

func _ready():
	$Area2D.connect("body_entered", self, "hit")
	pass

func hit(object):
	if object.get("lives") != null:
		#print("HIT SPIKE")
		object.lives -= 1
		world.get_node("Player/FX_hit").play()
		#print(object.lives)
	else:
		pass
	pass