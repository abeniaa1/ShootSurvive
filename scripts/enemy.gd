extends KinematicBody2D

export var speed = 100.0
var velocity = Vector2.ZERO
export var dead = false
export var hp = 3
var alive = true
var damage = 2
onready var bld = preload("res://scenes/blood.tscn")

func _ready():
	$anim.play("idle")

func alive():
	return alive

func _physics_process(delta):
	if dead:
		queue_free()
	elif !dead and alive:
		var dir = Global.player_pos
		look_at(dir)
		velocity.x =+ speed
		var motion = velocity * delta
		var rotated_motion = motion.rotated(rotation)  
		move_and_collide(rotated_motion)
		$hit.look_at(dir)

func apply_knockback():
	$anim.play("hit")
	$Area2D/CollisionShape2D.disabled
	var blood = bld.instance()
	get_parent().add_child(blood)
	blood.position = global_position

func dead():
	$CollisionShape2D.disabled
	Global.score += 2
	$hit.emitting = true
	$anim.play("die")
	Global.metal += 1






func _on_Area2D_area_entered(area):
	hp -= area.get_parent().dam()
	if hp <= 0:
		alive = false
		dead()
	if hp > 0 :
		apply_knockback()



