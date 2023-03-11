extends Node2D

onready var animated_sprite = $AnimatedSprite
var prologue1 = preload("res://Dialogues/prologue1.tres")
var prologue2 = preload("res://Dialogues/prologue2.tres")
var prologue3 = preload("res://Dialogues/prologue3.tres")
var prologue4 = preload("res://Dialogues/prologue4.tres")
var prologue5 = preload("res://Dialogues/prologue5.tres")

func _ready():
	animated_sprite.playing = true

func _process(delta):
	if animated_sprite.animation == "1_darkening" and animated_sprite.frame < 3:
		animated_sprite.playing = false
		DialogueManager.show_example_dialogue_balloon("prologue1", prologue1)
		animated_sprite.frame = 3
		animated_sprite.playing = true
	if animated_sprite.animation == "2_darkening" and animated_sprite.frame == 0:
		animated_sprite.playing = false
		DialogueManager.show_example_dialogue_balloon("prologue2", prologue2)
		animated_sprite.frame = 1
		animated_sprite.playing = true
	if animated_sprite.animation == "3_darkening" and animated_sprite.frame == 0:
		animated_sprite.playing = false
		DialogueManager.show_example_dialogue_balloon("prologue3", prologue3)
		animated_sprite.frame = 1
		animated_sprite.playing = true
	if animated_sprite.animation == "4_darkening" and animated_sprite.frame == 0:
		animated_sprite.playing = false
		DialogueManager.show_example_dialogue_balloon("prologue4", prologue4)
		animated_sprite.frame = 1
		animated_sprite.playing = true
	if animated_sprite.animation == "5_darkening" and animated_sprite.frame == 0:
		animated_sprite.playing = false
		DialogueManager.show_example_dialogue_balloon("prologue5", prologue5)
		animated_sprite.frame = 1
		animated_sprite.playing = true
		
func _on_AnimatedSprite_animation_finished():
	if animated_sprite.animation == "1_lightening":
		animated_sprite.play("1_darkening")
	elif animated_sprite.animation == "1_darkening":
		animated_sprite.play("2_lightening")
	elif animated_sprite.animation == "2_lightening":
		animated_sprite.play("2_darkening")
	elif animated_sprite.animation == "2_darkening":
		animated_sprite.play("3_lightening")
	elif animated_sprite.animation == "3_lightening":
		animated_sprite.play("3_darkening")
	elif animated_sprite.animation == "3_darkening":
		animated_sprite.play("4_lightening")
	elif animated_sprite.animation == "4_lightening":
		animated_sprite.play("4_darkening")
	elif animated_sprite.animation == "4_darkening":
		animated_sprite.play("5_lightening")
	elif animated_sprite.animation == "5_lightening":
		animated_sprite.play("5_darkening")
