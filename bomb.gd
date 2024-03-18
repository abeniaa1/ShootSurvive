extends RigidBody2D

var time = 1
onready var timer = $Timer
var cooldown = 3 / Global.multi
export var damgedelt = 5


func _ready():
	timer.start(time)
	$anim.play("throw")

func _on_Timer_timeout():
	$anim.play("boom")


func die():
	queue_free()



func dam():
	return damgedelt


func _on_anim_animation_finished(anim_name):
	if anim_name == "boom":
		die()
