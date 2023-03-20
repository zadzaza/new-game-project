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
	
	inventory_resize()

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

func inventory_resize():
	var visible_count = 0
	var vbox = get_node("Balloon/Margin/Inventory")
	var np_rect = get_node("Balloon")
	np_rect.rect_size.y = 117  # установка начальной высоты
	vbox.rect_min_size.y = 0
	for child in vbox.get_children():
		if child is RichTextLabel and child.visible == true:
			visible_count += 1
			vbox.rect_min_size.y += child.rect_size.y

	np_rect.rect_min_size.y = vbox.rect_min_size.y + np_rect.margin_top + np_rect.margin_bottom
