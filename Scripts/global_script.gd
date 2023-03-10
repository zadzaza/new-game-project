extends Node

var Animation = ""
var is_pause = false
var last_location = ""

func pause(s=1):
	get_tree().paused = bool(s)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if !s else Input.MOUSE_MODE_VISIBLE)
	return s
	
func is_pause():
	return get_tree().paused
