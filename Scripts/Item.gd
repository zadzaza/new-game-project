extends Node2D

var item_name
var item_quantity

func _ready():
	pass

func set_item(nm, qt):
	item_name = nm
	item_quantity = qt
	$TextureRect.texture = load("res://ui/items/" + item_name + ".png")
