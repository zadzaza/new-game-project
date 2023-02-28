extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed("escape"):
		$".".show()

func _on_Continue_pressed():
	$".".hide()

func _on_MainMenu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
