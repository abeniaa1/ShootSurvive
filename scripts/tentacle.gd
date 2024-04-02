extends Node2D


var noise = OpenSimplexNoise.new()
onready var line = Line2D.new()
export var amp = 15
export var speed = 5
export var size = 5
var time = 0.0
onready var texture = load("res://resouce/enemy/tnet.png")

func _ready():
	add_child(line)
	for i in size:
		noise.seed = rand_range(1000,0)
		line.default_color = $Line2D.default_color
		line.width = $Line2D.width
		line.width_curve = $Line2D.get_curve()
		line.texture = texture
		line.texture_mode = Line2D.LINE_TEXTURE_TILE
		line.joint_mode =Line2D.LINE_JOINT_ROUND
		line.antialiased = true
		var poi = Vector2(i*15,0)
		line.add_point(poi)
		line.set_point_position(0,Vector2(0,0))

func _physics_process(_delta):
	time += speed
	var value = noise.get_noise_2d(time, 0.0)*amp
	for i in size:
		if i > 0:
			var pos = Vector2(line.get_point_position(i).x,value*amp*sign(rand_range(-1,1)))
			line.set_point_position(i,lerp(line.get_point_position(i),pos,0.015))

