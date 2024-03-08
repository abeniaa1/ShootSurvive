extends KinematicBody2D

var time = 1
onready var timer = $Timer
var cooldown = 3

func _ready():
	timer.start(time)
	$anim.play("throw")

func _on_Timer_timeout():
	$anim.play("boom")
	$Timer2.start(0.8)

func die():
	queue_free()

func _on_Timer2_timeout():
	die()
