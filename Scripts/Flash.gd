extends Control

var color_rect 
var tween 

func _ready():
	color_rect = $CanvasLayer/ColorRect
	tween = Tween.new()
	color_rect.add_child(tween)
	tween.interpolate_property(color_rect, "modulate:a", 0, 1, 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.set_process(false)
	tween.connect("tween_completed", self, "on_tween_complete")
	
	flash()

func flash():
	tween.set_process(true)

func on_tween_complete():
	tween.interpolate_property(color_rect, "modulate:a", 1, 0, 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
