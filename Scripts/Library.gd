extends Node2D

var hanger = preload("res://Dialogues/hanger.tres")
var _body

func _ready():
	if GlobalScript.last_location == "MainScene":
		$YSort/Player.position = Vector2(815, 815)
		$YSort/Player.animation = "idle_up"
	if GlobalScript.last_location == "PortraitRoom":
		$YSort/Player.position = Vector2(57, 554)
		$YSort/Player.animation = "idle_side"

func _on_Door_entered(body):
	get_tree().change_scene("res://Scenes/PortraitRoom.tscn")
	GlobalScript.last_location = "Library"


func _on_ToStreet_body_entered(body):
	get_tree().change_scene("res://Scenes/MainScene.tscn")


func _on_Hanger_entered(body):
	pass


func _input(event):
	if event is InputEventKey and event.pressed and event.scancode == KEY_E:
		var overlapping_bodies = $YSort/Hanger/Area2D.get_overlapping_bodies()
		if overlapping_bodies.size() > 0 and overlapping_bodies[0].name == "Player":
			DialogueManager.show_example_dialogue_balloon("hanger", hanger)
