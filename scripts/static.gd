extends Node2D


var move =  null
export var knife = true
onready var knife_node = preload("res://scenes/knife.tscn")
export var scyth = false
onready var scythe_node = preload("res://scenes/scythe.tscn")


func _ready():
	spawn()
# Called when the node enters the scene tree for the first time.
func spawn():
	if knife:
		var k = knife_node.instance()
		add_child(k)
	if scyth:
		var s = scythe_node.instance()
		add_child(s)


func move_dir(dir):
	move = dir

func dir():
	return move
