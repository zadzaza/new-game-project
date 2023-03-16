extends Node2D

var start = preload("res://Dialogues/start.tres")
onready var animated_sprite = $AnimatedSprite
var animation = ""


func _on_Area2D_body_entered(body):
	pass

func _process(delta):
	animated_sprite.play(animation)
	
	if GameState.click_table == 0:
		GameState.table = "corpse"
		animation = "default"
	if GameState.click_table == 1:
		GameState.has_corpse = "have"
		GameState.table = "blood"
		animation = "blood"
	if GameState.click_table == 2 and GameState.has_rag == true:
		if Input.is_action_pressed("e"):
			if GameState.click_table == 2:
				var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
				if overlapping_bodies.size() > 0:
					GameState.table = "table"
					animation = "table"
		
	if GameState.table == "corpse":
		animation = "default"
	if GameState.table == "blood":
		animation = "blood"
	if GameState.table == "table":
		animation = "table"

func _input(event):
	if event.is_action_pressed("e"):
		if GameState.click_table <= 1:
			var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
			if overlapping_bodies.size() > 0:
				GameState.click_table += 1
