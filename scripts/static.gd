extends Node2D


export var knife = true
onready var nife = preload("res://scenes/knife.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	if knife:
		var k = nife.instance()
		add_child(k)

func move_dir(dir):
	$scythe.point_to(-dir)
