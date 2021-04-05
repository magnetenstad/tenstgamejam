extends Spatial

class_name Map

onready var mes0 = load("res://assets/Street_0.obj")
onready var mes1 = load("res://assets/Street_1.obj")
onready var mes2 = load("res://assets/Street_2.obj")
onready var mes3 = load("res://assets/Street_3.obj")
onready var mat0 = load("res://assets/materials/asphalt.tres")
onready var mat1 = load("res://assets/materials/curb.tres")

var rng = RandomNumberGenerator.new()
var tile_size = 7

func generate_grid(w, h):
	var grid = []
	for x in range(w):
		grid.append([])
		for z in range(h):
			grid[x].append(rng.randi_range(0, 3))
	return grid

func generate_tiles(grid):
	var meshes = [mes0, mes1, mes2, mes3]
	for x in grid.size():
		var col = grid[x]
		for z in col.size():
			var tile = Tile.new(meshes[col[z]], [mat0, mat1])
			tile.transform = tile.transform.translated(Vector3(x * tile_size, 0, z * tile_size))
			add_child(tile)

func _ready():
	rng.randomize()
	var grid = generate_grid(16, 16)
	generate_tiles(grid)
	transform = transform.translated(Vector3(- 8 * tile_size, 0, - 8 * tile_size))
