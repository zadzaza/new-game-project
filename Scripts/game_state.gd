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
var oborvano = false
var visit_na_portrete = false

#труп и стол
var table = "corpse"
var has_corpse = "not have"

#камин
var flame = false

func _process(delta):
	print(table)
