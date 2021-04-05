extends Spatial

#onready var player = $Player
var camera
var map

func _ready():
	map = Map.new()
	map.scale.x = 3
	map.scale.z = 3
	add_child(map)
	#camera = VehicleCamera.new(player)
	#camera.set_offset(Vector3(0, 10, -10))
	#add_child(camera)
