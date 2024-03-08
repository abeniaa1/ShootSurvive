extends Node2D
""""
export var itemPrefab: PackedScene
export var radius: float = 100
export var angularSpeed: float = 10000
export var spawnInterval: float = 10
export var max_items = 1000
onready var items = 0
onready var spawn = false
var currentAngle: float = 1

func _ready():
	randomize()
	
func _process(delta: float) -> void:
	var spawnPosition = Vector2(radius * cos(currentAngle), radius * sin(currentAngle))
	if rand_range(0,100) > 90:
		spawn = true
	if Global.player_pos - spawnPosition:
		if Global.player_pos - spawnPosition <= Vector2(-100,-100):
			spawn = false
	currentAngle += angularSpeed * delta*100
	if currentAngle >= TAU:  # Full rotation in radians (TAU = 2 * PI)
		currentAngle -= TAU
	if items < max_items:
		spawnItem(spawnPosition)

func spawnItem(position: Vector2) -> void:
	if spawn:
		var newItem = itemPrefab.instance()
		newItem.position = position
		add_child(newItem)
	radius += 10
	items += 1
"""
