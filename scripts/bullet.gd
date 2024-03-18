extends KinematicBody2D

var side 
var stop = false
var mode = null
export var speed = 100.0
var velocity = Vector2.ZERO
var dir = null
export var damgedelt = 1

func _ready():
	show_behind_parent = true
func set_mode(mod):
	mode = mod
	
func set_direction(direction: Vector2):
	velocity = direction.normalized() * speed
	$CPUParticles2D.look_at(direction)
	dir = direction
func dir(si):
	side = -si
	scale.x = side

func _physics_process(delta):
	if mode == 2:
		var motion = velocity * delta
		var rotated_motion = motion.rotated(-side*PI / 2.0)  
		move_and_collide(rotated_motion)
	if stop == false and mode == 1:
		position.x +=25*side


func dam():
	return damgedelt

func _on_Area2D_area_entered(area):
	$MeshInstance2D.hide()
	stop = true
	var layer = area.get_collision_layer()

	$impact.playing = true
	queue_free()


func hole():
	pass
