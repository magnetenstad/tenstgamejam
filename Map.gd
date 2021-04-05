extends Node

class_name Map

onready var mesh = load("res://assets/Street_0.obj")
onready var mat0 = load("res://assets/materials/asphalt.tres")
onready var mat1 = load("res://assets/materials/curb.tres")

func _ready():
	for x in range(-4, 4):
		for z in range(-4, 4):
			var tile = Tile.new(mesh, [mat0, mat1])
			tile.transform = tile.transform.translated(Vector3(x*20, 0, z*20))
			add_child(tile)
