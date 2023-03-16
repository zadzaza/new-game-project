extends Node

var has_coat = false

var Coat = "Coat"
var GoldenKey = "GoldenKey"

var meet = false

"""
	вешалка(пальто и саквояж): может иметь 3 состояния:
		have - есть в инвентаре
		not have - нет в инвентаре(пока не подобрал)
		give - положил в сундук
"""
var has_vc = "not have"

"""
	окно и портрет:
		oborvano - окно в надорванном состоянии, игрок сорвал занавеску
		visit_na_portrete - занавеска висит на портрете
"""
var okno = "ne oborvano"
var count_zanaveska = 0
var click_window = 0
var visit_na_portrete = false

#труп и стол
var table = "corpse"
var has_corpse = "not have"
var click_table = 0

#камин
var flame = false

#тряпка
var has_rag = false

#кнопки
var show_but_e = false

func _process(delta):
	print(click_table)
