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
			show()
	elif event.is_action_pressed("f") and GlobalScript.is_pause == true:
		GlobalScript.is_pause = false
		GlobalScript.pause(0)
		hide()


func _on_Coat_mouse_entered():
	if $Balloon/Margin2/Realization/Coat.bbcode_text != done:
		$Balloon/Margin2/Realization/Coat.bbcode_text = "Спрятать пальто"
func _on_Coat_mouse_exited():
	if $Balloon/Margin2/Realization/Coat.bbcode_text != done:
		$Balloon/Margin2/Realization/Coat.bbcode_text = not_done


func _on_Valise_mouse_entered():
	if $Balloon/Margin2/Realization/Valise.bbcode_text != done:
		$Balloon/Margin2/Realization/Valise.bbcode_text = "Спрятать саквояж"
func _on_Valise_mouse_exited():
	if $Balloon/Margin2/Realization/Valise.bbcode_text != done:
		$Balloon/Margin2/Realization/Valise.bbcode_text = not_done


func _on_Corpse_mouse_entered():
	if $Balloon/Margin2/Realization/Corpse.bbcode_text != done:
		$Balloon/Margin2/Realization/Corpse.bbcode_text = "Сжечь труп"
func _on_Corpse_mouse_exited():
	if $Balloon/Margin2/Realization/Corpse.bbcode_text != done:
		$Balloon/Margin2/Realization/Corpse.bbcode_text = not_done


func _on_Table_mouse_entered():
	if $Balloon/Margin2/Realization/Table.bbcode_text != done:
		$Balloon/Margin2/Realization/Table.bbcode_text = "Протереть тряпкой"
func _on_Table_mouse_exited():
	if $Balloon/Margin2/Realization/Table.bbcode_text != done:
		$Balloon/Margin2/Realization/Table.bbcode_text = not_done


func _on_Lamp_mouse_entered():
	if $Balloon/Margin2/Realization/Lamp.bbcode_text != done:
		$Balloon/Margin2/Realization/Lamp.bbcode_text = "Вернуть на место"
func _on_Lamp_mouse_exited():
	if $Balloon/Margin2/Realization/Lamp.bbcode_text != done:
		$Balloon/Margin2/Realization/Lamp.bbcode_text = not_done


func _on_Portrait_mouse_entered():
	if $Balloon/Margin2/Realization/Portrait.bbcode_text != done:
		$Balloon/Margin2/Realization/Portrait.bbcode_text = "Завесить портрет"
func _on_Portrait_mouse_exited():
	if $Balloon/Margin2/Realization/Portrait.bbcode_text != done:
		$Balloon/Margin2/Realization/Portrait.bbcode_text = not_done


func _on_Knife_mouse_entered():
	if $Balloon/Margin2/Realization/Knife.bbcode_text != done:
		$Balloon/Margin2/Realization/Knife.bbcode_text = "Спрятать нож"
func _on_Knife_mouse_exited():
	if $Balloon/Margin2/Realization/Knife.bbcode_text != done:
		$Balloon/Margin2/Realization/Knife.bbcode_text = not_done
