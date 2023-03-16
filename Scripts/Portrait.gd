extends Node2D


onready var button = get_node("Button")

func _process(delta):
	if GameState.visit_na_portrete:
		button.show_but_e = false
		$AnimatedSprite.play("zanaveska")


func _input(event):
	if event.is_action_pressed("e"):
		if GameState.count_zanaveska >= 1:
			if GameState.okno == "oborvano" or "oborvano2":
				var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
				if overlapping_bodies.size() > 0:
					$AnimatedSprite.play("zanaveska")
					GameState.visit_na_portrete = true
					GameState.count_zanaveska -= 1

func _on_Area2D_body_entered(body):
	button.show_but_e = true

func _on_Area2D_body_exited(body):
	button.show_but_e = false
