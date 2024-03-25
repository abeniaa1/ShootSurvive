extends Node2D


export var knife = true
onready var nife = preload("res://scenes/knife.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	if knife:
		var k = nife.instance()
		add_child(k)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
