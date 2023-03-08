 extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Exit_pressed():
	get_tree().quit()

func _on_StartGame_pressed():
	get_tree().change_scene("res://Scenes/RoomWithCorpse.tscn")
