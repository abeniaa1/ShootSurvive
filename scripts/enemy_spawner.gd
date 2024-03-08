extends Node2D

onready var enemy = preload("res://scenes/enemy.tscn")
var spawn_multiplier = 1
var no = 5
var minDistance = 200.0  # Minimum distance between enemies



func _ready():
	randomize()
	spawn(no)
	$Timer.start(10)


func spawn(n):
	var playerPos = Global.player_pos
	var spawnRadius = 1000.0

	for i in range(n):
		var ene = enemy.instance()
		add_child(ene)
		var validSpawn = false
		var spawnPos = Vector2()
		
		while not validSpawn:
			# Generate a random position within the spawn radius
			spawnPos.x = rand_range(playerPos.x - spawnRadius, playerPos.x + spawnRadius)
			spawnPos.y = rand_range(playerPos.y - spawnRadius, playerPos.y + spawnRadius)

			# Check if the spawn position is within the allowed range from the player
			var distanceToPlayer = spawnPos.distance_to(playerPos)
			if distanceToPlayer >= spawnRadius:
				# Check if the spawn position is far enough from existing enemies
				var validDistance = true
				for enemyNode in get_tree().get_nodes_in_group("EnemyGroup"):
					var distanceToEnemy = spawnPos.distance_to(enemyNode.position)
					if distanceToEnemy < minDistance:
						validDistance = false
						break
				
				if validDistance:
					validSpawn = true

		ene.position = spawnPos
		ene.add_to_group("EnemyGroup")



func _on_Timer_timeout():
	spawn(10 * spawn_multiplier)
	$Timer.start(10)
