extends Node

var player_pos = Vector2()
var score = 0
var metal = 0
var multi = 1
var shake = false
var timeshake = .3

func shake():
	shake = true
	return shake
func _physics_process(delta):
	if shake == true:
		timeshake -= delta
		if timeshake < 0:
			shake = false
			timeshake = .3
