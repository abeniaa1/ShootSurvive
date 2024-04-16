extends Node


export var gun = false
export var shuriken = false
export var electric = false
export var bomb = false
export var scythe = false
export var knive = false

func _process(delta):
	gun = get_parent().gun
	shuriken = get_parent().get_node("throwabls").suriken
	electric = get_parent().get_node("throwabls").lazering
	bomb = get_parent().get_node("throwabls").bombs
	scythe = get_parent().get_node("static").scyth
	knive = get_parent().get_node("static").knife
