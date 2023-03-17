extends Node2D

var overlapping_bodies
onready var button = get_node("Button")

func _ready():
	if GameState.has_rag == true:
		hide()

func _process(delta):
	overlapping_bodies = $Area2D.get_overlapping_bodies()
	
	if overlapping_bodies.size() > 0:
		if GameState.has_rag == false:
			button.show_but_e = true
		if GameState.has_rag == true:
			button.show_but_e = false

func _on_Area2D_body_entered(body):
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	button.show_but_e = false


func _input(event):
	if event.is_action_pressed("e"):
		var overlapping_bodies = $Area2D.get_overlapping_bodies()
		if overlapping_bodies.size() > 0:
			hide()
			GameState.has_rag = true
