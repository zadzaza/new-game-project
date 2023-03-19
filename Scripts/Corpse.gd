extends Node2D

var start = preload("res://Dialogues/start.tres")
onready var button = get_node("Button")
onready var animated_sprite = $AnimatedSprite
var animation = ""


func _on_Area2D_body_entered(body):
	pass

func _on_Area2D_body_exited(body):
	button.show_but_e = false

func _process(delta):
	animated_sprite.play(animation)
	
	var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
	
	
	if GameState.click_table == 0:
		GameState.table = "corpse"
		animation = "default"
		if overlapping_bodies.size() > 0:
			button.show_but_e = true
	if GameState.click_table == 1:
		GameState.table = "blood"
		animation = "blood"
		if overlapping_bodies.size() > 0 and GameState.has_rag == true:
			button.show_but_e = true
		if overlapping_bodies.size() > 0 and GameState.has_rag == false:
			button.show_but_e = false
	if GameState.click_table == 2:
		if GameState.has_rag == true:
			if Input.is_action_pressed("e"):
				if GameState.click_table == 2:
					if overlapping_bodies.size() > 0:
						GameState.table = "table"
						animation = "table"
						button.show_but_e = false
		if GameState.has_rag == true:
			if overlapping_bodies.size() > 0:
				button.show_but_e = true
		
	if GameState.table == "corpse":
		animation = "default"
	if GameState.table == "blood":
		animation = "blood"
	if GameState.table == "table":
		animation = "table"
		button.show_but_e = false
		
func _input(event):
	if event.is_action_pressed("e"):
		if GameState.click_table <= 1:
			var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
			if overlapping_bodies.size() > 0:
				GameState.has_corpse = "have"
				GameState.click_table += 1

