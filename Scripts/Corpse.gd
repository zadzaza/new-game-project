extends Node2D

var delay = 100
onready var sprite = $AnimatedSprite

func _process(delta):
	# замедляем анимацию на 0.5 секунды
	sprite.speed_scale = 0
	yield(get_tree().create_timer(delay), "timeout")

	# возвращаем множитель скорости к исходному значению
	sprite.speed_scale = 1
