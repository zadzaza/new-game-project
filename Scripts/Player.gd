extends KinematicBody2D


export var speed = 90
export var animation = ""
var last_input = ""
var _velocity = Vector2()
onready var animatedSprite = get_node("AnimatedSprite")
export var zoom_x = 1.0 setget set_zoom_x
export var zoom_y = 1.0 setget set_zoom_y
var end = preload("res://Dialogues/end.tres")

export var flip_h = false setget set_flip_h

func set_zoom_x(value):
	$Camera2D.zoom.x = value

func set_zoom_y(value):
	$Camera2D.zoom.y = value

func set_flip_h(value):
	$AnimatedSprite.flip_h = value

func _physics_process(delta):
	_velocity = _velocity.normalized() * speed
	move_and_slide(_velocity)
	animatedSprite.play(animation);
	stop_cam()
	
	if GameState.has_lamp == "have": 
		$Light2D.enabled = true
	if GameState.has_lamp == "not have" or GameState.has_lamp == "give":
		$Light2D.enabled = false
	
func _input(event):
	if event.is_action_pressed("pickup"):
		if $PickupZone.items_in_range.size() > 0:
			var pickup_item = $PickupZone.items_in_range.values()[0]
			pickup_item.pick_up_item(self)
			$PickupZone.items_in_range.erase(pickup_item)
			
	if event.is_action_pressed("tab"):
		var main_things = preload("res://Dialogues/main_things.tres")
		DialogueManager.show_example_dialogue_balloon("main_things", main_things)
	
	_velocity = Vector2()
	
	if event.is_action_pressed("e"):
		if GameState.has_vc == "give" and GameState.visit_na_portrete == true and GameState.flame == true and GameState.table == "table" and GameState.has_lamp == "give" and GameState.has_knife == "give":
			DialogueManager.show_example_dialogue_balloon("end", end)
	
	if Input.is_action_pressed("ui_right"):
		if GameState.has_lamp == "have":
			animation = "move_side_lamp"
			last_input = "move_side_lamp"
		if GameState.has_lamp == "not have" or GameState.has_lamp =="give":
			animation = "move_side"
			last_input = "move_side"
		_velocity.x += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		if GameState.has_lamp == "have":
			animation = "move_side_lamp"
			last_input = "move_side_lamp"
		if GameState.has_lamp == "not have" or GameState.has_lamp =="give":
			animation = "move_side"
			last_input = "move_side"
		_velocity.x -= 1
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("ui_down"):
		if GameState.has_lamp == "have":
			animation = "move_down_lamp"
			last_input = "move_down_lamp"
		if GameState.has_lamp == "not have" or GameState.has_lamp =="give":
			animation = "move_down"
			last_input = "move_down"
		_velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		if GameState.has_lamp == "have":
			animation = "move_up_lamp"
			last_input = "move_up_lamp"
		if GameState.has_lamp == "not have" or GameState.has_lamp =="give":
			animation = "move_up"
			last_input = "move_up"
		_velocity.y -= 1
	
	if last_input == "move_side" && (Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right")):
		animation = "idle_side"
	if last_input == "move_up" && Input.is_action_just_released("ui_up"):
		animation = "idle_up"
	if last_input == "move_down" && Input.is_action_just_released("ui_down"):
		animation = "idle_down"
	
	if last_input == "move_side_lamp" && (Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right")):
		animation = "idle_side_lamp"
	if last_input == "move_up_lamp" && Input.is_action_just_released("ui_up"):
		animation = "idle_up_lamp"
	if last_input == "move_down_lamp" && Input.is_action_just_released("ui_down"):
		animation = "idle_down_lamp"


func stop_cam():
	pass
