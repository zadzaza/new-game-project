extends Node2D

func _ready():
	if GameState.oborvano == true:
		$AnimatedSprite.play("not_default")

func _process(delta):
	pass

func _on_Window_entered(body):
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("e"):
		var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
		if overlapping_bodies.size() > 0:
			$AnimatedSprite.play("not_default")
			GameState.oborvano = true
			if GameState.table == "corpse":
				GameState.table = "corpse"
			if GameState.table == "blood":
				GameState.table = "blood"
