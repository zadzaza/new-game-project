extends Node2D

onready var animated_sprite = $AnimatedSprite
var animation = ""
onready var button = get_node("Button")
var overlapping_bodies

func _process(delta):
	animated_sprite.play(animation)
	print(GameState.has_corpse)
	
	overlapping_bodies = $Area2D.get_overlapping_bodies()
	
	if GameState.flame == true:
		GameState.has_corpse = "burned"
	
	if overlapping_bodies.size() > 0:
		if GameState.has_corpse == "have":
			button.show_but_e = true
		if GameState.has_corpse == "burned":
			button.show_but_e = false
	
func _ready():
	$Light2D.enabled = false
	
	if GameState.flame == true:
		animation = "loop"
		$Light2D.enabled = true

func _on_Area2D_body_entered(body):
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("e"):
		if animation != "loop":
			if GameState.has_corpse == "have":
				overlapping_bodies = $Area2D.get_overlapping_bodies()
				if overlapping_bodies.size() > 0:
					animation = "start"
					$Light2D.enabled = true
					GameState.flame = true

func _on_AnimatedSprite_animation_finished():
	if animation == "start":
		animation = "loop"
