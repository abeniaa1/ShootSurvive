extends Node2D

var bomb = preload("res://scenes/bomb.tscn") 
var lazer = preload("res://scenes/electirc_bolt.tscn")
var shuriken = preload("res://scenes/shuriken.tscn")
export var bombs = false
export var lazering = false
export var srkn = false

var cooldown = 2
onready var cool = cooldown

func _physics_process(delta):
	cool -= delta
	if cool <= 0:
		if bombs:
			var boom = bomb.instance()
			get_parent().get_parent().get_parent().add_child(boom)
			boom.position = Global.player_pos
			boom.rotation_degrees = rand_range(0,360)
		if srkn:
			var srkn = shuriken.instance()
			get_parent().get_parent().get_parent().add_child(srkn)
			srkn.position = Global.player_pos
			srkn.rotation_degrees = rand_range(0,360)
			cool = cooldown
		if lazering:
			var laz = lazer.instance()
			add_child(laz)
			laz.rotation_degrees = rand_range(0,359)
