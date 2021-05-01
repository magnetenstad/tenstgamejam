extends Spatial

class_name Map

onready var no_road = load("res://assets/No_road.obj")
onready var straight = load("res://assets/Straight.obj")
onready var turn = load("res://assets/Turn.obj")
onready var t_intersection = load("res://assets/T_intersection.obj")
onready var x_intersection = load("res://assets/X_intersection.obj")
onready var mat0 = load("res://assets/materials/asphalt.tres")
onready var mat1 = load("res://assets/materials/curb.tres")
onready var road_map = load("res://assets/road_map.png")

var tile_size = 7

onready var get_type_and_orientation = {
	0 : [0, 0],
	1 : [0, 0],
	2 : [0, 0],
	3 : [2, 2],
	4 : [0, 0],
	5 : [1, 1],
	6 : [2, 3],
	7 : [3, 3],
	8 : [0, 0],
	9 : [2, 1],
	10 : [1, 0],
	11 : [3, 2],
	12 : [2, 0],
	13 : [3, 1],
	14 : [3, 0],
	15 : [4, 0]
}

onready var meshes = [
	[no_road, [mat1]],
	[straight, [mat0, mat1]],
	[turn, [mat1, mat0]],
	[t_intersection, [mat0, mat1]],
	[x_intersection, [mat0, mat1]]
]


func generate_binary_grid():
	var data = road_map.get_data()
	data.lock()
	var grid = []
	for x in range(road_map.get_size().x):
		grid.append([])
		for z in range(road_map.get_size().y):
			grid[x].append(data.get_pixel(x, z).gray())
	return grid

func generate_tiles(grid):
	var adjacent_nudges = [Vector2(1, 0), Vector2(0, -1), Vector2(-1, 0), Vector2(0, 1)]
	for x in grid.size():
		for z in grid[x].size():
			var grid_pos = Vector2(x,z)
			var type_and_orientation = [0, 0]
			if grid[grid_pos.x][grid_pos.y]:
				var neighbour_is_road = 0
				for i in adjacent_nudges.size():
					var nudge = adjacent_nudges[i]
					var neighbour_pos = grid_pos + nudge
					if abs(neighbour_pos.x) < grid.size() and abs(neighbour_pos.y) < grid[x].size() and grid[neighbour_pos.x][neighbour_pos.y]:
						neighbour_is_road += pow(2, i)
				type_and_orientation = get_type_and_orientation[int(neighbour_is_road)]
			var mesh = meshes[type_and_orientation[0]]
			var tile = Tile.new(mesh[0], mesh[1])
			tile.transform = tile.transform.translated(Vector3(x * tile_size, 0, z * tile_size))
			var r = type_and_orientation[1]
			var phi = r * PI / 2
			tile.transform.basis = tile.transform.basis.rotated(Vector3(0, 1, 0), phi)
			add_child(tile)

func _ready():
	var grid = generate_binary_grid()
	generate_tiles(grid)
	transform = transform.translated(Vector3(- 8 * tile_size, 0, - 8 * tile_size))
