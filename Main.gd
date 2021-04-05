extends Spatial

var map

func _ready():
	map = Map.new()
	add_child(map)

