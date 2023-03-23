extends Node2D

var start = preload("res://Dialogues/start.tres")

func _ready():
	$YSort/Player/AnimationText.hide()
	
	if GlobalScript.last_location == "":
		#$YSort/Player.position = Vector2(748, 129)
		$YSort/Player.animation = "idle_down"
		#DialogueManager.show_example_dialogue_balloon_new("start", start)
	if GlobalScript.last_location == "Library":
		$YSort/Player.position = Vector2(1126, 349)
		$YSort/Player.animation = "idle_side"
		$YSort/Player.flip_h = true
	if GlobalScript.last_location == "Toilet":
		$YSort/Player.position = Vector2(419, -38)
		$YSort/Player.animation = "idle_down"
		$YSort/Player.flip_h = false

func _on_Door_entered(body):
	get_tree().change_scene("res://Scenes/Library.tscn")
	GlobalScript.last_location = "PortraitRoom"
func _on_Door2_entered(body):
	get_tree().change_scene("res://Scenes/Toilet.tscn")
	GlobalScript.last_location = "PortraitRoom"


func _on_Sofas_body_entered(body):
	if GameState.sofas_entered == false:
		$YSort/Player/AnimationText.restart_animation()
		GameState.play_txt = true
		$YSort/Player/AnimationText.label.bbcode_text = "[center]Это старая комната, в которую никто не заходил уже лет 15. Идеальное место для портрета, который никто не должен видеть.[/center]"
		GameState.sofas_entered = true
func _on_Sofas_body_exited(body):
	GameState.play_txt = false


func _on_Corps_body_entered(body):
	if GameState.corps_entered == false:
		if GameState.has_corpse == "not have":
			$YSort/Player/AnimationText.restart_animation()
			GameState.play_txt = true
			$YSort/Player/AnimationText.label.bbcode_text = "[center]Бедный Бэзил! Какая ужасная смерть! Я должен превратить его в [u]горсточку пепла[/u].[/center]"
			GameState.corps_entered = true
		if GameState.has_corpse == "have":
			GameState.play_txt = false
func _on_Corps_body_exited(body):
	GameState.play_txt = false


func _on_Fire_body_entered(body):
	if GameState.fire_entered == false:
		if GameState.has_corpse == "not have":
			$YSort/Player/AnimationText.restart_animation()
			GameState.play_txt = true
			$YSort/Player/AnimationText.label.bbcode_text = "[center]Газовый камин с асбестом, он может мне пригодиться...[/center]"
			GameState.fire_entered = true
func _on_Fire_body_exited(body):
	GameState.play_txt = false
