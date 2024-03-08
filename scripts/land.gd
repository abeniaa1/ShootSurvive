extends StaticBody2D

onready var mes = $MeshInstance2D
onready var col = $CollisionShape2D
onready var areacol = $Area2D/CollisionShape2D

func set_name(nm):
	$Label.text = str(nm)

func set_dir(rot):
	look_at(rot)
	var length = self.position.distance_to(rot)
	var quo = mes.mesh.duplicate(true)
	mes.mesh = quo
	mes.mesh.size.x = length
	mes.mesh.center_offset.x = length/2
	var shp  = col.shape.duplicate(true)
	col.shape = shp
	col.shape.extents.x = length/2
	col.position.x += length/2
	areacol.shape = shp
	areacol.shape.extents.x = length/2
	areacol.position.x += length/2

	
func last():
	return position

func _on_land_area_entered(area):
	queue_free()
