extends Node2D

var hanger = preload("res://Dialogues/hanger.tres")

func _process(delta):
	print(GameState.play_txt)

func _ready():
	if GlobalScript.last_location == "MainScene":
		$YSort/Player.position = Vector2(815, 815)
		$YSort/Player.animation = "idle_up"
	if GlobalScript.last_location == "PortraitRoom":
		$YSort/Player.position = Vector2(57, 554)
		$YSort/Player.animation = "idle_side"

func _on_Door_entered(body):
	get_tree().change_scene("res://Scenes/PortraitRoom.tscn")
	GlobalScript.last_location = "Library"

func _on_ToStreet_body_entered(body):
	pass


func _on_Skaf_body_entered(body):
	if GameState.skaf_entered == false:
		GameState.play_txt = true
		$YSort/Player/AnimationText.label.bbcode_text = "[center]\"Эмали и камеи\" Готье в роскошном издании Шарпантье на японской бумаге с гравюрами Жакмара. Книгу эту подарил мне Адриан Синглтон, хотя кому я это рассказываю? В любом случае, нужно будет прочесть на досуге.[/center]"
		GameState.skaf_entered = true
