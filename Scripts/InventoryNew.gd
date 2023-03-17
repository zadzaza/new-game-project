extends CanvasLayer

var done = "Выполнено"
var not_done = "Не выполнено"

var show



func _process(delta):
	if GameState.has_vc == "give":
		$Balloon/Margin2/Realization/Coat.bbcode_text = done
		$Balloon/Margin2/Realization/Valise.bbcode_text = done
	if GameState.visit_na_portrete == true:
		$Balloon/Margin2/Realization/Portrait.bbcode_text = done
	if GameState.flame == true:
		$Balloon/Margin2/Realization/Corpse.bbcode_text = done
	if GameState.table == "table":
		$Balloon/Margin2/Realization/Table.bbcode_text = done
	if GameState.has_lamp == "give":
		$Balloon/Margin2/Realization/Lamp.bbcode_text = done
	if GameState.has_knife == "give":
		$Balloon/Margin2/Realization/Knife.bbcode_text = done

func _input(event):
	if event.is_action_pressed("f"):
		visible = not visible
		
	if event.is_action_pressed("f") and GlobalScript.is_pause == false:
		GlobalScript.is_pause = true
		if GlobalScript.pause() == 1:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			show()
	elif event.is_action_pressed("f") and GlobalScript.is_pause == true:
		GlobalScript.is_pause = false
		GlobalScript.pause(0)
		hide()
