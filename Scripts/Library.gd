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
	pass

func _on_ToStreet_body_entered(body):
	pass
