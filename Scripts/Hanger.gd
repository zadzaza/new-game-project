extends Node2D

export var animation = "Hanger_Dressed_Bag"
var item_name = "Coat"
var hanger = preload("res://Dialogues/hanger.tres")

func _process(delta):
	$AnimatedSprite.play(animation)
	
	if GameState.has_vc == "have" or "give":
		animation = "Hanger"
	if GameState.has_vc == "not have":
		animation = "Hanger_Dressed_Bag"
	
		

func _on_Hanger_entered(body):
	pass

func _input(event):
	if event.is_action_pressed("e"):
		if GameState.has_vc == "not have":
			var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
			if overlapping_bodies.size() > 0 and overlapping_bodies[0].name == "Player":
				DialogueManager.show_example_dialogue_balloon("hanger", hanger)
