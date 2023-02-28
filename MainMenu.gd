extends Node2D

func _on_Exit_pressed():
	get_tree().quit()


func _on_StartGame_pressed():
	get_tree().change_scene("res://Scenes/MainScene.tscn")
