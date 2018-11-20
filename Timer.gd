extends RichTextLabel

var time = 0.0
var disabled = false

func _ready():
	pass

func _process(delta):
	if !disabled:
		time += delta
		text = str(time)
	else:
		pass
