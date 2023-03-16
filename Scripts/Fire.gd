extends Node2D

onready var animated_sprite = $AnimatedSprite
var animation = ""

func _process(delta):
	animated_sprite.play(animation)
	
func _ready():
	$Light2D.enabled = false
	
	if GameState.flame:
		animation = "loop"
		$Light2D.enabled = true

func _on_Area2D_body_entered(body):
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("e"):
		if GameState.has_corpse == "have":
			var overlapping_bodies = $Area2D.get_overlapping_bodies()
			if overlapping_bodies.size() > 0:
				GameState.has_corpse = "burned"
				animation = "start"
				$Light2D.enabled = true
				GameState.flame= true

func _on_AnimatedSprite_animation_finished():
	if animation == "start":
		animation = "loop"