extends Node2D

var bomb = preload("res://scenes/bomb.tscn") 

var cooldown = 3
onready var cool = cooldown

func _physics_process(delta):
	cool -= delta
	if cool <= 0:
		var boom = bomb.instance()
		get_parent().get_parent().add_child(boom)
		boom.position = Global.player_pos
		boom.rotation_degrees = rand_range(0,360)
		cool = cooldown
