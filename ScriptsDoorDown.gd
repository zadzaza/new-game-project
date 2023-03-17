extends Node2D

var dela = preload("res://Dialogues/dela.tres")

func _on_Area2D_body_entered(body):
	if GameState.go_street == true:
		get_tree().change_scene("res://Scenes/VideoPlayer.tscn")
	else: DialogueManager.show_example_dialogue_balloon("dela", dela)
