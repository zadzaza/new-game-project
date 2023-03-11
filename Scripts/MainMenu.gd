 extends Node2D

var transition = preload("res://Scenes/Transition.tscn").instance()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	transition.fade_out(0.5)

func _on_Exit_pressed():
	get_tree().quit()

func _on_StartGame_pressed():
	get_tree().change_scene("res://Scenes/RoomWithCorpse.tscn")
