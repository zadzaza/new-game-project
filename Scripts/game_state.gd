extends Node

var has_key = false
var IronKey = "Iron Key"
var meet = false
var have_vc = false

func _process(delta):
	has_key()

func has_key():
	for IronKey in range(10):
		if PlayerInventory.inventory.has(IronKey) == true:
			has_key = true
