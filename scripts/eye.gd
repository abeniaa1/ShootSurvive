extends Node2D

var noise = OpenSimplexNoise.new()
var time = 0
var speed = .2



func _ready():
	randomize()
	speed = rand_range(0.5,0.1)
	noise.seed = rand_range(1000,-3445)



func _process(_delta):
	time += speed
	var valx = noise.get_noise_2d(time,0) *100
	var valy = noise.get_noise_2d(0,time) *100
	$Sprite.position = Vector2(valx,valy)

func _physics_process(delta):
	if rand_range(400,-1) <= 0:
		blink()



func blink():
	$Sprite2.play("blink")


func _on_Sprite2_animation_finished():
	$Sprite2.play("see")
