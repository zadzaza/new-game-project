extends Node2D

onready var label = $Balloon/RichTextLabel
onready var tween = $Balloon/RichTextLabel/Tween
onready var ballon = $Balloon

var indent_x = 10
var indent_y = 50

export var complete_speed = 5.0
export var start_in = 0.0
export var start_out = 1.0

export(NodePath) var label_path: NodePath

func _ready():
	
	if label_path:
		label = get_node(label_path)
	
	# запуск анимации всплывающего текста
	tween.interpolate_property(
		label, "percent_visible",
		start_in, start_out, complete_speed, Tween.EASE_IN, Tween.EASE_OUT)
	
	position.y -= indent_y

func _process(delta):
	# проверка глобальной переменной, разрешающей или запрещающей проигрыш анимации
	if GameState.play_txt == true:
		show()
		tween.start()
	if GameState.play_txt == false:
		hide()


func _on_Tween_tween_completed(object, key):
	yield(get_tree().create_timer(2.0), "timeout") # ожидание 2 секунд, после чего play_txt принимает false и форма закрывается
	GameState.play_txt = false

func _on_Tween_tween_started(object, key):
	# корректировка размера формы в соответствии с размером RichTextLabel
	ballon.rect_size.y = label.rect_size.y + indent_y
	ballon.rect_size.x = label.rect_size.x + indent_x
