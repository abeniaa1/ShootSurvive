extends Area2D

var collected = false

func _ready():
	$AnimatedSprite.play("idle")

func _on_metal_area_entered(area):
	$AnimationPlayer.play("collect")
	collect_metal(10)
	collected = true

func _physics_process(delta):
	if collected:
		var dir = Global.player_pos
		var velocity = (dir - global_position).normalized() * 300
		position += velocity * delta


func collect_metal(no):
	Global.metal += no
	$Timer.start(1)




func _on_Timer_timeout():
	Global.score += 10
	queue_free()
	
