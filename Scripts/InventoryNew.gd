extends CanvasLayer


func _process(delta):
	if GameState.has_vc == "have":
		$Balloon/Margin/Inventory/Coat.visible = true
		$Balloon/Margin/Inventory/Valise.visible = true
	else: 
		$Balloon/Margin/Inventory/Coat.visible = false
		$Balloon/Margin/Inventory/Valise.visible = false

	if GameState.click_window > 0:
		$Balloon/Margin/Inventory/Curtain.visible = true
		if GameState.visit_na_portrete == true:
			$Balloon/Margin/Inventory/Curtain.visible = false

	if GameState.has_corpse == "have":
		$Balloon/Margin/Inventory/Corpse.visible = true
	if GameState.has_corpse == "not have":
		$Balloon/Margin/Inventory/Corpse.visible = false
	if GameState.has_corpse == "burned":
		$Balloon/Margin/Inventory/Corpse.visible = false

	if GameState.has_lamp == "have":
		$Balloon/Margin/Inventory/Lamp.visible = true
	else: $Balloon/Margin/Inventory/Lamp.visible = false
	
	if GameState.has_knife == "have":
		$Balloon/Margin/Inventory/Knife.visible = true
	else: $Balloon/Margin/Inventory/Knife.visible = false
	
	if GameState.has_rag == true:
		$Balloon/Margin/Inventory/Rag.visible = true
	else: $Balloon/Margin/Inventory/Rag.visible = false

func _input(event):
	if event.is_action_pressed("i"):
		visible = not visible
		
	if event.is_action_pressed("i") and GlobalScript.is_pause == false:
		GlobalScript.is_pause = true
		if GlobalScript.pause() == 1:
			show()
	elif event.is_action_pressed("i") and GlobalScript.is_pause == true:
		GlobalScript.is_pause = false
		GlobalScript.pause(0)
		hide()

