extends KinematicBody2D

export var speed = 100.0
var velocity = Vector2.ZERO
export var dead = false
export var hp = 3
var alive = true
var damage = 2
enum rec_dam {slice,shoot,explosion}
onready var bld = preload("res://scenes/blood.tscn")
onready var damind = preload("res://scenes/txt.tscn")


func _ready():
	$tentacles.spawn_tentacles(10,85)
	$anim.play("idle")
	randomize()
	$Skin.hide()
	$eyes.hide()
	$tentacles.hide()

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
	

func apply_knockback():
	$eyes.blinking()
	$anim.play("hit")
	$Area2D/CollisionShape2D.disabled
	var blood = bld.instance()
	get_parent().add_child(blood)
	blood.position = global_position

func dead():
	$CollisionShape2D.queue_free()
	$Area2D.queue_free()
	Global.score += 5
	$anim.play("die")
	Global.metal += 5

func damager():
	return damage



func _on_Area2D_area_entered(area):
	var dam = area.get_parent().dam()
	hp -= dam
	apply_knockback()
	show_damage(dam)
	sound()
	if hp <= 0:
		alive = false
		dead()
	if hp > 0 :
		apply_knockback()

func sound():
	$splatter.pitch_scale = rand_range(1,5)
	$splatter.play()

func show_damage(d):
	var note = damind.instance()
	get_parent().add_child(note)
	note.position = position
	note.text(d)
	


func _on_damage_area_entered(area):
	set_physics_process(false)





func _on_damage_area_exited(area):
	set_physics_process(true)



func _on_VisibilityNotifier2D_screen_exited():
	$Skin.hide()
	$eyes.hide()
	$tentacles.hide()


func _on_VisibilityNotifier2D_screen_entered():
	$Skin.show()
	$eyes.show()
	$tentacles.show()
