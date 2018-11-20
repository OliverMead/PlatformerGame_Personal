extends Sprite

#onready var world = get_parent()

func _ready():
	$Area2D.connect("body_entered", self, "hit")
	pass

func hit(object):
	if object.get("starCount") != null:
		#print("HIT STAR")
		object.starCount += 1
		#print(object.starCount)
		visible = false
		#$Area2D/CollisionShape2D.call_deferred("set_disabled", true)
		queue_free()
	else:
		pass
	pass