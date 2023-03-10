extends Node2D

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
