extends Node2D



func _on_Area2D_body_entered(body):
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("e"):
		var overlapping_bodies = $Area2D.get_overlapping_bodies()
		if overlapping_bodies.size() > 0:
			hide()
			GameState.has_rag = true
