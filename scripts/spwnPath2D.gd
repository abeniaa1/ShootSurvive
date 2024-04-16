extends Path2D

export var land = preload("res://resouce/ground/land.tscn")
var radius = 25
export var count = 420  # Increase this for more points

func _ready():
	spawn()
	
func spawn():
	randomize()
	var angle_increment = 20 * PI / count  # New variable for angle increment
	for i in range(count):  # Make sure to use range() for loops in GDScript
		var prv = Vector2(0,0)
		if i != 0: 
			prv = curve.get_point_position(i-1)
		var angle = i * angle_increment  # Use angle_increment here
		var nw_pos = Vector2(radius * cos(angle), radius * sin(angle))
		curve.add_point(nw_pos)
		if i > 2:
			if i == 2:
				$Line2D.set_point_position(0,nw_pos)
			$Line2D.add_point(nw_pos)
			var lan = land.instance()
			add_child(lan)
			lan.position = curve.get_point_position(i)
			lan.set_name(str(i))  # Make sure to convert integers to strings for set_name()
			lan.set_dir(prv)
		radius += 15  # Decrease this for a tighter curve
