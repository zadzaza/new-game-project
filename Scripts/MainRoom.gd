extends Node2D

var start = preload("res://Dialogues/start.tres")

func _ready():
	if GlobalScript.last_location == "":
		$YSort/Player.position = Vector2(748, 129)
		$YSort/Player.animation = "idle_down"
		DialogueManager.show_example_dialogue_balloon_new("start", start)
	if GlobalScript.last_location == "Library":
		$YSort/Player.position = Vector2(1126, 349)
		$YSort/Player.animation = "idle_side"
		$YSort/Player.flip_h = true
	if GlobalScript.last_location == "Toilet":
		$YSort/Player.position = Vector2(419, -38)
		$YSort/Player.animation = "idle_down"
		$YSort/Player.flip_h = false

func _on_Door_entered(body):
	get_tree().change_scene("res://Scenes/Library.tscn")
	GlobalScript.last_location = "PortraitRoom"


func _on_Door2_entered(body):
	get_tree().change_scene("res://Scenes/Toilet.tscn")
	GlobalScript.last_location = "PortraitRoom"
