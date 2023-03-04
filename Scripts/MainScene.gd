extends Node2D

func _ready():
	GlobalScript.pause(0)
	if $IronKey.being_picked_up == true:
		$IronKey.queue_free()
		print("da")

func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	GlobalScript.pause(1)
	var test_dialogue = preload("res://Dialogues/test_Dialogue.tres")
	DialogueManager.show_example_dialogue_balloon("test_Dialogue", test_dialogue)
