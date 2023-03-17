extends Node2D

var overlapping_bodies
onready var button = get_node("Button")

func _on_Area2D_body_entered(body):
	pass

func _on_Area2D_body_exited(body):
	button.show_but_e = false

func _ready():
	if GameState.visit_na_portrete == true:
		$AnimatedSprite.play("zanaveska")

func _process(delta):
	overlapping_bodies = $Area2D.get_overlapping_bodies()
	
	if overlapping_bodies.size() > 0:
		if GameState.visit_na_portrete == true:
			button.show_but_e = false
			$AnimatedSprite.play("zanaveska")
		if GameState.visit_na_portrete == false:
			button.show_but_e = true
		if GameState.visit_na_portrete == false and GameState.okno == "ne oborvano":
			button.show_but_e = false
		
		print(GameState.visit_na_portrete)


func _input(event):
	if event.is_action_pressed("e"):
		if GameState.count_zanaveska >= 1:
			if GameState.okno == "oborvano" or GameState.okno == "oborvano":
				overlapping_bodies = $Area2D.get_overlapping_bodies() #Списком тел внутри Area2D
				if overlapping_bodies.size() > 0:
					$AnimatedSprite.play("zanaveska")
					
					GameState.visit_na_portrete = true
					
					GameState.count_zanaveska -= 1
