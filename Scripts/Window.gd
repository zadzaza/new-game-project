extends Node2D

onready var animated_sprite = $AnimatedSprite
var animation = ""

func _ready():
	pass

func _process(delta):
	animated_sprite.play(animation)

	
	if GameState.click_window == 0:
		GameState.okno = "ne oborvano"
		animation = "ne_oborvano"
	if GameState.click_window == 1:
		GameState.okno = "oborvano"
		animation = "oborvano"
	if GameState.click_window == 2:
		GameState.okno = "oborvano2"
		animation = "oborvano2"

func _on_Window_entered(body):
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("e"):
		var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
		if overlapping_bodies.size() > 0:
			GameState.click_window += 1
