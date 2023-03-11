extends Node2D

var transition = preload("res://Scenes/Transition.tscn").instance()

func _ready():
	transition.fade_out(0.5)

func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	var test_dialogue = preload("res://Dialogues/test_Dialogue.tres")
	DialogueManager.show_example_dialogue_balloon("test_Dialogue", test_dialogue)
