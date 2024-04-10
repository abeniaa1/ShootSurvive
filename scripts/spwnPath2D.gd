extends Path2D


export var land = preload("res://resouce/ground/land.tscn")
var radius = 25
export var count = 42


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
		if i > 2:
			if i == 2:
				$Line2D.set_point_position(0,nw_pos)
			$Line2D.add_point(nw_pos)
			var lan = land.instance()
			add_child(lan)
			lan.position = curve.get_point_position(i)
			lan.set_name(i)
			lan.set_dir(prv)
			if i + 1 == count:
				get_parent().position.x = -nw_pos.x - 500
				var laa = land.instance()
				add_child(laa)
				laa.global_position = Vector2(0,-500)
				laa.scale.x *= 40
		radius += 100


