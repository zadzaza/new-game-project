extends CanvasLayer

var show_but_e = false

func _process(delta):
	if show_but_e == true:
		show()
		$AnimatedSprite.play("e")
	else: hide()
