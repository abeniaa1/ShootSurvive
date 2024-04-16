extends Node2D

var bomb = preload("res://scenes/bomb.tscn") 
var lazer = preload("res://scenes/electirc_bolt.tscn")
var shuriken = preload("res://scenes/shuriken.tscn")

export var bombs = false
export var lazering = false
export var suriken = false

var cooldown_mtplr = 1

var bomb_cooldown = 5.0
var lazer_cooldown = 3.0
var shuriken_cooldown = 2.0

var bomb_timer = 0.0
var lazer_timer = 0.0
var shuriken_timer = 0.0

func _process(delta):
	if bombs:
		bomb_timer += delta
		if bomb_timer > bomb_cooldown:
			spawn_powerup(bomb,false)
			bomb_timer = 0.0

	if lazering:
		lazer_timer += delta
		if lazer_timer > lazer_cooldown:
			spawn_powerup(lazer,true)
			lazer_timer = 0.0

	if suriken:
		shuriken_timer += delta
		if shuriken_timer > shuriken_cooldown:
			spawn_powerup(shuriken,false)
			shuriken_timer = 0.0

func spawn_powerup(powerup,par):
	if par:
		var instance = powerup.instance()
		add_child(instance)
		instance.rotate(deg2rad(rand_range(0,360)))

	else:
		var instance = powerup.instance()
		instance.position = global_position
		get_parent().get_parent().get_parent().add_child(instance)


