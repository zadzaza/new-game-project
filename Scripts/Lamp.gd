extends Node2D

onready var button = get_node("Button")

func _on_Area2D_body_entered(body):
	pass

func _on_Area2D_body_exited(body):
	button.show_but_e = false

func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("e"):
		
