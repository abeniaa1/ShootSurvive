extends Node2D

export var add = 0

func _ready():
	$txt/anim.play("show")

func text(d):
	$txt.text = str(d,"0")



func _physics_process(delta):
	position.y += add

func _on_anim_animation_finished(anim_name):
	queue_free()

