extends VehicleBody

class_name Vehicle

func _process(delta):
	_vehicle_process(delta)
	
func _vehicle_process(_delta):
	set_steering(get_steering() * (1 - abs(get_engine_force()) / 10000))
	set_engine_force(0)
