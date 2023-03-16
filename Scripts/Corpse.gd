extends Node2D

var start = preload("res://Dialogues/start.tres")
onready var animated_sprite = $AnimatedSprite
var animation = ""


func _on_Area2D_body_entered(body):
	pass

func _process(delta):
	animated_sprite.play(animation)
	
	if GameState.table == "corpse":
		animation = "default"
	if GameState.table == "blood":
		animation = "blood"

func _input(event):
	if event.is_action_pressed("e"):
		var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
		if overlapping_bodies.size() > 0:
			if GameState.table == "corpse":
				animation = "blood"
				GameState.table = "blood"
				GameState.has_corpse = "have"
			if GameState.table == "blood":
				pass
