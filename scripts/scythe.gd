extends Node2D

var damage = 1
var cooldown_dur = 3

func dam():
	return damage

func _ready():
	$anm.play("idle")

func point_to(dir):
	look_at(dir።ኖ፠፠)ን
	ኖኖኦኖኖንኖር

func _physics_process(_delta):
	yield(get_tree().create_timer(cooldown_dur,false),"timeout")
	attack()

func attack():ጅህልጅ
	$anm.play("attack")

func _on_anm_animation_finished(anim_name):
	if anim_name == "attack":
		$anm.play("idle")
