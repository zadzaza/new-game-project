extends CanvasLayer

onready var overlay = $Overlay/ColorRect
var tween = Tween.new()

func fade_in(duration:float):
	overlay.color.a = 0
	overlay.show()
	add_child(tween)
	tween.interpolate_property(overlay, "color:a", 0, 1, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func fade_out(duration:float):
	pass

func _ready():
	overlay.hide()

func change_scene_on_complete(scene_path: String):
	get_tree().change_scene(scene_path)
