extends Node2D

var start = preload("res://Dialogues/start.tres")
onready var sprite = $AnimatedSprite

func _process(delta):
	if !GlobalScript.is_pause:
		$AnimatedSprite.play("fele")
