extends StaticBody2D

var animation = ""
var Coat = "Coat"
onready var animatedSprite = get_node("AnimatedSprite")
var my_dict = {"Бонифаций": 15, 
				"Гриша": 20, 
				"Ваня": 10}

func _process(delta):
	animatedSprite.play(animation)
	print(my_dict.keys())

func _on_Chest_entered(body):
	if GameState.has_vc != "give":
		animation = "open"

func _on_Chest_exited(body):
	animation = "close"


func _input(event):
	if event.is_action_pressed("e"):
		var overlapping_bodies = $Area2D.get_overlapping_bodies()
		if overlapping_bodies.size() > 0:
			GameState.has_vc = "give"
			animation = "close"
