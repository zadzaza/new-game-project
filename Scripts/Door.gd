extends Node2D

onready var pl = preload("res://Scenes/Player.tscn")
export var flip_h = false setget set_flip_h

func set_flip_h(value):
	$AnimatedSprite.flip_h = value
	$CollisionShape2D.position.x = 31

func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("OpenDoor")


func _on_Area2D_body_exited(body):
	$AnimatedSprite.play("CloseDoor")
