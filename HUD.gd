extends CanvasLayer

onready var textNode = get_node("ColorRect/RichTextLabel")
onready var world = get_parent()
onready var playerNode = world.get_node("Player")

func _ready():
	pass

func _process(delta):
	textNode.text = str(playerNode.starCount) + " / " + str(world.starNum)