extends Node

var has_coat = false

var Coat = "Coat"
var GoldenKey = "GoldenKey"

var meet = false
var have_vc = false

var oborvano = false

func _process(delta):
	has_coat()

func has_coat():
	for Coat in range(10):
		if PlayerInventory.inventory.has(Coat) == true:
			has_coat = true
