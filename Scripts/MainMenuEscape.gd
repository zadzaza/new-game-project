extends Node2D

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("escape") and GlobalScript.is_pause == false:
		GlobalScript.is_pause = true
		if GlobalScript.pause() == 1:
			show()
	elif event.is_action_pressed("escape") and GlobalScript.is_pause == true:
		GlobalScript.is_pause = false
		GlobalScript.pause(0)
		hide()
		
func _on_Continue_pressed():
	hide()
	GlobalScript.is_pause = false
	GlobalScript.pause(0)

func _on_MainMenu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	GlobalScript.is_pause = false
	GlobalScript.pause(0)


