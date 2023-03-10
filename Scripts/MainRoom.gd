extends Node2D

func _ready():
	if GlobalScript.last_location == "":
		$YSort/Player.position = Vector2(958, 76)
		$YSort/Player.animation = "idle_down"

func _on_Door_entered(body):
	get_tree().change_scene("res://Scenes/Library.tscn")
