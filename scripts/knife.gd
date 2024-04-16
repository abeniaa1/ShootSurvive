extends Node2D

export var da = 1
export var rate_persec = .5
var time = rate_persec
var sfx = load("res://resouce/blade/Ninja Star.wav")

func dam():
	return da
	
	
	
func _physics_process(delta):
	time -= delta
	if time < 0:
		$Area2D/CollisionShape2D.disabled = false
		time = rate_persec
	else:
		$Area2D/CollisionShape2D.disabled = true



func _on_Area2D_area_entered(area):
	$sfx.play()
	
