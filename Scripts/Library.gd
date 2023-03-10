extends Node2D



func _on_Door_entered(body):
	get_tree().change_scene("res://Scenes/PortraitRoom.tscn")


func _on_ToStreet_body_entered(body):
	get_tree().change_scene("res://Scenes/MainScene.tscn")
