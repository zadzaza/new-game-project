extends StaticBody2D

var animation = ""
var Coat = "Coat"
onready var animatedSprite = get_node("AnimatedSprite")

func _process(delta):
	animatedSprite.play(animation)
	print(PlayerInventory.inventory.keys())

func _on_Chest_entered(body):
	animation = "open"

func _on_Chest_exited(body):
	animation = "close"

func _input(event):
	if event.is_action_pressed("e"):
		var overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
		if overlapping_bodies.size() > 0:
			for Coat in range(10):
				if PlayerInventory.inventory.has(Coat):
					PlayerInventory.inventory.erase("Coat")
					print("working")
