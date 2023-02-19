extends Area2D



func _on_ToWorld_body_entered(body):
	get_tree().change_scene("res://Scenes/MainScene.tscn")
