extends Node

var player_pos = Vector2()
var score = 0
var metal = 0
var multi = 1
var shak = false
var timeshake = .3
var intensity = 0

func shake(i):
	shak = true
	intensity = i
	return intensity

