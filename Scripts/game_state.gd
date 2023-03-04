extends Node

var has_key = false
var IronKey = "Iron Key"

func _process(delta):
	has_key()
	print(has_key)

func has_key():
	for IronKey in range(10):
		if PlayerInventory.inventory.has(IronKey) == true:
			has_key = true
