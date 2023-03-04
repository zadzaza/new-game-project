extends Node

var has_key = false
var IronKey = "Iron Key"
var meet = false

func _process(delta):
	check_key()
	print(has_key)

func check_key():
	for IronKey in PlayerInventory.inventory:
		if PlayerInventory.inventory.has(IronKey) == true:
			has_key = true
