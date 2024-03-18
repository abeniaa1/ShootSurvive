extends RayCast2D

var casting := false setget set_casting
onready var line = $Line2D
export var damage = 30

func _ready():
	set_physics_process(false)
	appear()
	
	line.points[1] = Vector2.ZERO


func _physics_process(delta):
	var cast_point := cast_to
	force_raycast_update()
	
	$Particles2.emitting = is_colliding()
	if is_colliding():
		cast_point = to_local(get_collision_point())
		$Particles2.global_rotation = get_collision_normal().angle()
		$Particles2.position = cast_point
	line.points[1] = cast_point
	var length = self.position.distance_to(cast_point)
	var area = $Area2D/CollisionShape2D
	var shpe = area.shape.duplicate(true) 
	area.shape = shpe
	area.shape.extents.x = length/2
	area.position.x =  length/2
	


func set_casting(cast):
	casting = cast
	
	$Particles.emitting = casting
	if casting:
		appear()
	else:
		$Particles.emitting = false
		disappear()
	set_physics_process(casting)
	
	

func appear():
	var tween = $Tween
	tween.stop_all()
	tween.interpolate_property(line,"width",0,50.0,0.1)
	tween.start()
	set_physics_process(true)
	$Particles.emitting = true

func disappear():
	var tween = $Tween
	tween.stop_all()
	tween.interpolate_property(line,"width",50.0,0,0.1)
	tween.start()
	$Particles2.emitting = false
	$Particles.emitting = false
	set_physics_process(false)
	queue_free()

func _on_Timer_timeout():
	disappear()


func dam():
	return damage
