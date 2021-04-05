extends Spatial

onready var mesh = load("res://assets/Street_0.obj")
onready var mat0 = load("res://assets/materials/asphalt.tres")
onready var mat1 = load("res://assets/materials/curb.tres")

var tile

func _ready():
	tile = Tile.new(mesh, [mat0, mat1])
	add_child(tile)
	
