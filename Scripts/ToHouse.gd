extends Area2D



func _on_ToHouse_body_entered(body):
	get_tree().change_scene("res://Scenes/Library.tscn")
	GlobalScript.last_location = "MainScene"
