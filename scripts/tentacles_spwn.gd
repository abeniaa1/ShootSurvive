extends Node2D


var tentacle = preload("res://scenes/tentacle.tscn")  # Replace with your actual tentacle scene path



func spawn_tentacles(count, radius):
	for i in range(count):
		var angle = rand_range(0, 2 * PI)  # Random angle in radians
		var position = Vector2(cos(angle), sin(angle)) * radius  # Position on the circle

		var tentacle_instance = tentacle.instance()
		tentacle_instance.position = position
		add_child(tentacle_instance)
		tentacle_instance.rotate(angle)
