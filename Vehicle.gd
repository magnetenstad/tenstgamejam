extends VehicleBody

class_name Vehicle

func _ready():
	set_linear_damp(0.2)
	
func _process(delta):
	_vehicle_process(delta)
	
func _vehicle_process(_delta):
	set_steering(get_steering() * (1 - abs(get_linear_velocity().length()) / 1000))
	set_engine_force(0)
