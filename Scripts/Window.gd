extends Node2D

onready var animated_sprite = $AnimatedSprite
onready var button = get_node("Button")
var animation = ""

func _ready():
	if GameState.okno == "oborvano":
		animation = "oborvano"

func _process(delta):
	animated_sprite.play(animation)

	
	if GameState.click_window == 0:
		GameState.okno = "ne oborvano"
		animation = "ne_oborvano"
	if GameState.click_window == 1:
		GameState.okno = "oborvano"
		animation = "oborvano"
		button.show_but_e = false
		
func _on_Window_entered(body):
	button.show_but_e = true

func _on_Window_exited(body):
	button.show_but_e = false

func _input(event):
	if GameState.click_window != 2:
		if event.is_action_pressed("e"):
			var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
			if overlapping_bodies.size() > 0:
				GameState.click_window += 1
				GameState.count_zanaveska += 1
