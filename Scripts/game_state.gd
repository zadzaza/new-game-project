extends Node

var has_coat = false

var skaf_entered = false
var rag_entered = false
var sofas_entered = false
var corps_entered = false
var fire_entered = false

var play_txt = false

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

#лампа
var has_lamp = "not have"

#нож
var has_knife = "not have"

var END = false
var go_street = false

func _process(delta):
	if GameState.has_vc == "give" and GameState.visit_na_portrete == true and GameState.flame == true and GameState.table == "table" and GameState.has_lamp == "give" and GameState.has_knife == "give":
		END = true
