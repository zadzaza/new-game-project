extends Node2D

export var animation = "Hanger_Dressed_Bag"

func _process(delta):
	$AnimatedSprite.play(animation)
