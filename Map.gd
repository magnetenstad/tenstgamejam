extends Spatial

class_name Map

onready var mes0 = load("res://assets/Street_0.obj")
onready var mes1 = load("res://assets/Street_1.obj")
onready var mes2 = load("res://assets/Street_2.obj")
onready var mes3 = load("res://assets/Street_3.obj")
onready var mat0 = load("res://assets/materials/asphalt.tres")
onready var mat1 = load("res://assets/materials/curb.tres")
onready var road_map = load("res://assets/road_map.png")

var rng = RandomNumberGenerator.new()
var tile_size = 7

func generate_binary_grid(w, h):
	var data = road_map.get_data()
	data.lock()
	var grid = []
	for x in range(w):
		grid.append([])
		for z in range(h):
			grid[x].append(data.get_pixel(x, z).gray())
	return grid

func generate_tiles(grid):
	var meshes = [mes0, mes1, mes2, mes3]
	for x in grid.size():
		var col = grid[x]
		for z in col.size():
			var tile = Tile.new(meshes[col[z]], [mat0, mat1])
			tile.transform = tile.transform.translated(Vector3(x * tile_size, 0, z * tile_size))
			var r = rng.randi_range(0, 3)
			var phi = r * PI / 2
			tile.transform.basis = tile.transform.basis.rotated(Vector3(0, 1, 0), phi)
			tile.transform = tile.transform.translated(Vector3(- int(r == 2 or r == 1) * tile_size, 0, - int(r == 3 or r == 2) * tile_size))
			add_child(tile)

func _ready():
	#rng.randomize()
	var grid = generate_binary_grid(16, 16)
	generate_tiles(grid)
	transform = transform.translated(Vector3(- 8 * tile_size, 0, - 8 * tile_size))
