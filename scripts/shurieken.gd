extends KinematicBody2D

export var speed: float = 300
export var bounce_factor: float = 1.01
export var max_b = 5
export var damage = 4
onready var sound = $sfx
var cooldown = 2
var throw = "res://resouce/shuuriken/shuriken1.wav"
var collide = "res://resouce/shuuriken/446102__justinvoke__metal-clank-1.wav"


var velocity: Vector2

func _ready() -> void:
	sound.stream = load(throw)
	sound.play()
	velocity = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized() * speed

func _physics_process(delta: float) -> void:
	rotation_degrees += 15
	var motion: Vector2 = velocity * delta
	var collision: KinematicCollision2D = move_and_collide(motion)
	if collision:
		sound.stream = load(collide)
		sound.volume_db = -10
		sound.play()
		max_b -= 1
		var normal: Vector2 = collision.normal
		velocity = velocity.bounce(normal) * bounce_factor

		motion = velocity * delta
		move_and_collide(motion)
		
	if max_b < 0:
		queue_free()

func dam():
	return damage





