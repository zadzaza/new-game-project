extends Node2D

func _ready():
	if GlobalScript.last_location == "PortraitRoom":
		$YtmOti/Player.position = Vector2(111, 299)
		$YtmOti/Player.animation = "idle_up"


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Scenes/PortraitRoom.tscn")
	GlobalScript.last_location = "Toilet"
