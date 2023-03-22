extends Node2D

onready var label = $Balloon/RichTextLabel
onready var tween = $Balloon/RichTextLabel/Tween
onready var ballon = $Balloon

var indent_x = 10
var indent_y = 32
export var text: String

func _ready():
	if label != null:
		text = label.bbcode_text
	
	tween.interpolate_property(
		label, "percent_visible",
		0.0, 1.0, 5.0, Tween.EASE_IN, Tween.EASE_OUT)
	
	ballon.rect_size.y = label.rect_size.y+indent_y
	ballon.rect_size.x = label.rect_size.x+indent_x

func _process(delta):
	if GameState.play_txt == true:
		show()
		tween.start()
	if GameState.play_txt == false:
		hide()

func _on_Tween_tween_completed(object, key):
	yield(get_tree().create_timer(2.0), "timeout") # wait for 2 seconds after the completion of the Tween animation
	GameState.play_txt = false
