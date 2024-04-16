extends RigidBody2D

var time = 1
onready var timer = $Timer
var cooldown = 3
export var damgedelt = 5


func _ready():
	timer.start(time)
	$anim.play("throw")

func _on_Timer_timeout():
	$anim.play("boom")
	Global.shake(1)


func die():
	queue_free()



func dam():
	return damgedelt

func _on_anim_animation_finished(anim_name):
	
	if anim_name == "boom":
		for i in get_children():
			i.set_physics_process(false)
			i.set_process(false)
			i.set_process_input(false)
			i.set_process_internal(false)
			i.set_process_unhandled_input(false)
			i.set_process_unhandled_key_input(false)

