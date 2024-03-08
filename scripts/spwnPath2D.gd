extends Path2D


export var land = preload("res://resouce/ground/land.tscn")
var radius = 50
export var zoomspeed = 50
export var count = 42

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()
	
	
func spawn():
	randomize()
	for i in count:
		var prv = Vector2(0,0)
		if i != 0: 
			prv = curve.get_point_position(i-1)
		var nw_pos = Vector2(radius * cos(i), radius * sin(i))
		curve.add_point(nw_pos)
		var prob = 85
		var gapped = false
		if i > 10:
			if prob >= rand_range(0,100) and !gapped:
				var lan = land.instance()
				add_child(lan)
				lan.position = curve.get_point_position(i)
				lan.set_name(i)
				lan.set_dir(prv)
				radius += i*5
				gapped = true
			else:
				gapped = false


