extends Node2D

var damage = 1
var cooldown_dur = 0.5
var can_attack = true 

func dam():
	return damage

func _ready():
	$anm.play("idle")
	randomize()


func _physics_process(_delta):
	var direction =  get_parent().dir()
	rotation = direction.angle()
	if can_attack:
		attack()
		$sfx.pitch_scale = rand_range(1,3)
		can_attack = false
func attack():
	$anm.play("attack")


func _on_anm_animation_finished(anim_name):
	$anm.play("idle")
	yield(get_tree().create_timer(cooldown_dur,false),"timeout")
	can_attack = true
