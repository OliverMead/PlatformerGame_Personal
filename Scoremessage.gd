extends RichTextLabel

onready var world = get_tree().get_root().get_node("World")
onready var player = world.get_node("Player")

func _ready():
	var stars = world.starNum
	var lives = player.lives
	var time = world.time
	var score = (100 * stars * lives) / time
	text = "Your Score = (100 x " + str(stars) + " x " + str(lives) + ") / " + str(time) + "\n = " + str(score)