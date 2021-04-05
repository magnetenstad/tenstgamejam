extends Camera

class_name VehicleCamera

var target
var offset : Vector3

func _init(target):
	self.target = target
	
func _process(_delta):
	look_at(target.transform.origin, Vector3(0, 1, 0))
	transform.origin = target.transform.origin + offset.rotated(Vector3(0, 1, 0), target.transform.basis.get_euler().y)

func set_offset(offset):
	self.offset = offset

