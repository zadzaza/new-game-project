extends Node2D

var hanger = preload("res://Dialogues/hanger.tres")
var _body


func _process(delta):
	print(GlobalScript.is_pause)

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
	var transition = preload("res://Scenes/Transition.tscn").instance()
	get_tree().get_root().add_child(transition)
	transition.fade_in(0.5)
	transition.tween.connect("tween_completed", transition, "change_scene_on_complete", [ "res://Scenes/MainScene.tscn" ])
