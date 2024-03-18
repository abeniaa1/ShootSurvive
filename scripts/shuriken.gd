extends RigidBody2D


var aim = Vector2.ZERO



func _ready():
	randomize()
	aim = Vector2(rand_range(-5,5),rand_range(5,-5))
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	apply_central_impulse(aim)
	
