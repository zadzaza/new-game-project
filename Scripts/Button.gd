extends CanvasLayer

func _ready():
	hide()

func _process(delta):
	if GameState.show_but_e == true:
		show()
		$AnimatedSprite.play("e")
	else: hide()
