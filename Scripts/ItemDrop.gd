extends KinematicBody2D

const max_speed = 1000
const acceleration = 500
var item_name
var item_quantity
var velocity = Vector2()

var player = null
var being_picked_up = false

func _ready():
	item_name = "Golden Key"

func _physics_process(delta):
	if being_picked_up == false:
		#velocity = velocity.move_toward(Vector2(0, max_speed), acceleration * delta)
		pass
	else:
		var direction = global_position.direction_to(player.global_position)
		velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
		
		var distance = global_position.distance_to(player.global_position)
		if distance < 6:
			PlayerInventory.add_item(item_name, 1)
			queue_free()
		
	velocity = move_and_slide(velocity, Vector2())

func pick_up_item(body):
	player = body
	being_picked_up = true
