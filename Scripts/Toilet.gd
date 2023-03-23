extends Node2D

func _ready():
	if GlobalScript.last_location == "PortraitRoom":
		$YtmOti/Player.position = Vector2(111, 299)
		$YtmOti/Player.animation = "idle_up"


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Scenes/PortraitRoom.tscn")
	GlobalScript.last_location = "Toilet"


func _on_RagArea_body_entered(body):
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("e"):
		if GameState.rag_entered == false:
			var overlapping_bodies = $RagArea.get_overlapping_bodies()
			if overlapping_bodies.size() > 0:
				GameState.play_txt = true
				$YtmOti/Player/AnimationText.label.bbcode_text = "[center]Вонючая тряпка... \nЕю можно вытереть кровь со стола.[/center]"
				GameState.rag_entered = true
