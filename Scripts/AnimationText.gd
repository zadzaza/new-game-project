extends Node2D

var indent_x = 10
var indent_y = 32

func _ready():
	$Balloon/RichTextLabel/Tween.interpolate_property(
		$Balloon/RichTextLabel, "percent_visible",
		0.0, 1.0, 5.0, Tween.EASE_IN, Tween.EASE_OUT)
	$Balloon/RichTextLabel/Tween.start()
	
	$Balloon.rect_size.y = $Balloon/RichTextLabel.rect_size.y+indent_y
	$Balloon.rect_size.x = $Balloon/RichTextLabel.rect_size.x+indent_x
