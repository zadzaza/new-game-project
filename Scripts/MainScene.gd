extends Node2D

func _ready():
	pass

func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	var test_dialogue = preload("res://Dialogues/test_Dialogue.tres")
	DialogueManager.show_example_dialogue_balloon("test_Dialogue", test_dialogue)
