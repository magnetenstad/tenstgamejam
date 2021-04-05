extends StaticBody

class_name Tile

var mesh_instance
var collision_shape

func _init(mesh, materials):
	mesh_instance = MeshInstance.new()
	mesh_instance.set_mesh(mesh)
	mesh_instance.create_trimesh_collision()
	add_child(mesh_instance)
	for i in materials.size():
		mesh_instance.set_surface_material(i, materials[i])
