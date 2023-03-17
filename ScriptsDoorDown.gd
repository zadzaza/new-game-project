extends Node2D

var dela = preload("res://Dialogues/dela.tres")
var end = preload("res://Dialogues/end.tres")

func _on_Area2D_body_entered(body):
	if GameState.END == true:
		get_tree().change_scene("res://Scenes/VideoPlayer.tscn")
	else: DialogueManager.show_example_dialogue_balloon("dela", dela)
