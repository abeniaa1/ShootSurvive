extends Node2D


var count = 25
var radius = 2
var intended_radius = 90
var intended_scale = 0.15  # Set this to the desired scale of your eyes

onready var curve = Line2D.new()
onready var eye = preload("res://scenes/eye.tscn")
var points = []

func _ready():
	spawn()


func spawn():
	randomize()
	var radius_increment = intended_radius / count
	for i in range(count):
		var prv = Vector2(0,0)
		if i != 0: 
			prv = curve.get_point_position(i-1)
		var nw_pos = Vector2(radius * cos(i), radius * sin(i))
		curve.add_point(nw_pos)
		if i > 2:
			points.append(prv)
		radius += radius_increment
		if i + 1 == count:
			curve.queue_free()
			eyes()



func eyes():
	var scale_increment = intended_scale / points.size()
	for i in range(points.size()):
		var eyez = eye.instance()
		add_child(eyez)
		eyez.position = points[i]
		var scale_factor = abs(sin((i + 1) * scale_increment))  # Sinusoidal function for scale
		eyez.scale = Vector2(scale_factor, scale_factor)
		eyez.look_at(Vector2(0,0))


func blinking():
		for child in get_children():
				child.blink()
