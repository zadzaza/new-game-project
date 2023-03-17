 extends Node2D

var transition = preload("res://Scenes/Transition.tscn").instance()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	transition.fade_out(0.5)

func _on_Exit_pressed():
	get_tree().quit()

func _on_StartGame_pressed():
	get_tree().change_scene("res://Scenes/Prologue.tscn")
	
	GameState.has_vc = "not have"
	GameState.okno = "ne oborvano"
	GameState.click_window = 0
	GameState.visit_na_portrete = false
	GameState.table = "corpse"
	GameState.has_corpse = "not have"
	GameState.click_table = 0
	GameState.flame = false
	GameState.has_rag = false
	GameState.has_lamp = "not have"
	GameState.has_knife = "not have"
	GameState.END = false
	GameState.go_street = false
