extends CanvasLayer

onready var starNode = get_node("ColorRect/RichTextLabel")
onready var lifeNode = get_node("ColorRect2/RichTextLabel")
onready var world = get_parent()
onready var playerNode = world.get_node("Player")

func _ready():
	pass

func _process(delta):
	starNode.text = str(playerNode.starCount) + " / " + str(world.starNum)
	lifeNode.text = str(playerNode.lives)
	