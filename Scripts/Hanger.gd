extends Node2D

export var animation = "Hanger_Dressed_Bag"
var item_name = "Coat"
var hanger = preload("res://Dialogues/hanger.tres")

func _process(delta):
	$AnimatedSprite.play(animation)
	
	if GameState.have_vc:
		$AnimatedSprite.animation = "Hanger"
		PlayerInventory.add_item(item_name, 1)
		

func _on_Hanger_entered(body):
	pass

func _input(event):
	if event.is_action_pressed("e"):
		if !GameState.have_vc:
			var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
			if overlapping_bodies.size() > 0 and overlapping_bodies[0].name == "Player":
				DialogueManager.show_example_dialogue_balloon("hanger", hanger)
