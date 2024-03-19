extends KinematicBody2D

var click_pos = Vector2(0, 0)
const bullet = preload("res://scenes/bullet.tscn")
var side = 0
export var cooldown = false
var speed = 300
var closest = Vector2.ZERO
onready var cooldown_dur = 0.5
var see = false
export var hp = 10

func _process(delta):
	
	var multiplier = Global.multi
	get_parent().get_node("ui/score").text = str(Global.score)
	if Global.score > 50 * multiplier:
		get_parent().get_node("ui")._upgrade()

func _physics_process(delta):
	move()
	closest = find_closest_enemy()
	Global.player_pos = position
	if !cooldown:
		click_pos = closest
		var hand_node = null
		var rotation_offset = 0.0
		if position - click_pos <= Vector2(0,0):
			hand_node = $handR
			rotation_offset = -PI / 2.0
			side = 1
		else:
			hand_node = $handL
			rotation_offset = -PI / 2.0
			side = -1
		if position.distance_to(click_pos) < 1000 and hand_node and closest:
			var direction = click_pos - hand_node.global_position
			var target_rotation = atan2(direction.y, direction.x) + rotation_offset
			hand_node.rotation = target_rotation
			shoot(side)
			cooldown = true
			
			$time.start(cooldown_dur)

func find_closest_enemy():
	var enemies = get_tree().get_nodes_in_group("enemies")
	var closest_dis = float(500)
	var closest_pos = Vector2.ZERO
	

	for enemy in enemies:
		var enemy_pos = enemy.position
		var dist = position.distance_to(enemy_pos)
		if dist < closest_dis:
			closest_dis = dist
			closest_pos = enemy_pos
	return closest_pos
func shoot(side):
	$anim2.play("New Anim")
	sound()
	var bull = bullet.instance()
	add_child(bull)
	bull.set_mode(2)
	bull.dir(side)
	shoot_light(side)

	if side == 1:
		var hand = $handR
		hand.frame = 0
		hand.play()
		bull.position = $handR.position
		var direction = Vector2.RIGHT.rotated(hand.rotation)
		bull.set_direction(direction)

	if side == -1:
		var hand = $handL
		hand.frame = 0
		hand.play("default")
		bull.position = $handL.position
		var direction = Vector2.LEFT.rotated(hand.rotation)
		bull.set_direction(direction)
		shoot_light(side)
	


func shoot_light(side):
	var light = $Light2D
	if side > 0:
		pass
	elif side < 0:
		pass
	pass

	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.0
	timer.one_shot = true
	timer.autostart = true
	timer.connect("timeout", self, "hide")

func hide():
	pass

func sound():
	$boom.play()

func move():
	
	var input_vector = Vector2()
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	input_vector = get_parent().get_node("ui/Virtual joystick").get_output()
	var velocity = input_vector * speed
	move_and_slide(velocity)
	
func _on_time_timeout():
	cooldown = false



func _on_Area2D_area_entered(area):
	var dam = area.get_parent().damage
	hp -= dam
	if hp == 0:
		print("dead")

