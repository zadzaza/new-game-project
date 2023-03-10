extends Node2D

var start = preload("res://Dialogues/start.tres")

func _ready():
	if GlobalScript.last_location == "":
		$YSort/Player.position = Vector2(958, 76)
		$YSort/Player.animation = "idle_down"
		#DialogueManager.show_example_dialogue_balloon("start", start)
	if GlobalScript.last_location == "Library":
		$YSort/Player.position = Vector2(1126, 349)
		$YSort/Player.animation = "idle_side"
		$YSort/Player.flip_h = true

func _on_Door_entered(body):
	get_tree().change_scene("res://Scenes/Library.tscn")
	GlobalScript.last_location = "PortraitRoom"
