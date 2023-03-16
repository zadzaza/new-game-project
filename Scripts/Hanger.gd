extends Node2D

export var animation = "Hanger_Dressed_Bag"
var item_name = "Coat"
onready var button = get_node("Button")
var overlapping_bodies
var hanger = preload("res://Dialogues/hanger.tres")

func _process(delta):
	$AnimatedSprite.play(animation)
	
	overlapping_bodies = $Area2D.get_overlapping_bodies()
	
	if GameState.has_vc == "have" or "give":
		animation = "Hanger"
		button.show_but_e = false
	if GameState.has_vc == "not have":
		animation = "Hanger_Dressed_Bag"
	
	if overlapping_bodies.size() > 0 and GameState.has_vc == "not have":
		button.show_but_e = true

func _on_Hanger_entered(body):
	pass

func _on_Area2D_body_exited(body):
	button.show_but_e = false

func _input(event):
	if event.is_action_pressed("e"):
		if GameState.has_vc == "not have":
			overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
			if overlapping_bodies.size() > 0 and overlapping_bodies[0].name == "Player":
				DialogueManager.show_example_dialogue_balloon("hanger", hanger)



