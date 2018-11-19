extends Sprite



func _ready():
	$Area2D.connect("body_entered", self, "hit")
	pass

func hit(object):
	print("HIT")
	object.starCount += 1
	print(object.starCount)
	pass