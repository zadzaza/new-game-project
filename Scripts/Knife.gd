extends Node2D

var overlapping_bodies
onready var button = get_node("Button")


func _on_Area2D_body_entered(body):
	pass

func _on_Area2D_body_exited(body):
	button.show_but_e = false

func _ready():
	if GameState.has_knife == "have" or GameState.has_knife == "give":
		hide()

func _process(delta):
	overlapping_bodies = $Area2D.get_overlapping_bodies()
	
	if overlapping_bodies.size() > 0:
		if GameState.has_knife == "not have":
			button.show_but_e = true
		if GameState.has_knife == "have":
			button.show_but_e = false

func _input(event):
	if event.is_action_pressed("e"):
		overlapping_bodies = $Area2D.get_overlapping_bodies()
		if overlapping_bodies.size() > 0:
			if GameState.has_knife == "not have":
				GameState.has_knife = "have"
				hide()
