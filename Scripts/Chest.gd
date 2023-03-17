extends StaticBody2D

var animation = ""
var Coat = "Coat"
onready var animatedSprite = get_node("AnimatedSprite")

func _ready():
	if GameState.has_vc == "give" and GameState.has_knife == "give":
		animation = "close"

func _process(delta):
	animatedSprite.play(animation)
	
	if GameState.has_vc == "give" and GameState.has_knife == "give":
		animation = "close"

func _on_Chest_entered(body):
	if GameState.has_vc == "have" or GameState.has_vc == "not have":
		animation = "open"
	if GameState.has_knife == "have" or GameState.has_knife == "not have":
		animation = "open"

func _on_Chest_exited(body):
	animation = "close"


func _input(event):
	if event.is_action_pressed("e"):
		var overlapping_bodies = $Area2D.get_overlapping_bodies()
		if overlapping_bodies.size() > 0:
			if GameState.has_vc == "have":
				GameState.has_vc = "give"
			if GameState.has_knife == "have":
				GameState.has_knife  = "give"
