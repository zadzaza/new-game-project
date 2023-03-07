extends KinematicBody2D


export var Speed = 4700
export var animation = ""
var LastInput = ""
var _velocity = Vector2()

export var flip_h = false setget set_flip_h

func set_flip_h(value):
	$AnimatedSprite.flip_h = value

func _physics_process(delta):
	get_input(delta)
	
	
func _input(event):
	if event.is_action_pressed("pickup"):
		if $PickupZone.items_in_range.size() > 0:
			var pickup_item = $PickupZone.items_in_range.values()[0]
			pickup_item.pick_up_item(self)
			$PickupZone.items_in_range.erase(pickup_item)

func get_input(delta):
	var animatedSprite = get_node("AnimatedSprite")
	_velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		animation = "move_side"
		_velocity.x += Speed
		LastInput = "move_side"
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		animation = "move_side"
		_velocity.x -= Speed
		LastInput = "move_side"
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("ui_down"):
		animation = "move_down"
		_velocity.y += Speed
		LastInput = "move_down"
	if Input.is_action_pressed("ui_up"):
		animation = "move_up"
		_velocity.y -= Speed
		LastInput = "move_up"
	
	if LastInput == "move_side" && (Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right")):
		animation = "idle_side"
	if LastInput == "move_up" && Input.is_action_just_released("ui_up"):
		animation = "idle_up"
	if LastInput == "move_down" && Input.is_action_just_released("ui_down"):
		animation = "idle_down"
		
	move_and_slide(_velocity * delta)
	animatedSprite.play(animation);
