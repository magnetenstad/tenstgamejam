extends VehicleBody

func _ready():
	pass


func _process(delta):
	set_engine_force(0)
	if Input.is_action_pressed("ui_up"):
		set_engine_force(200)
	if Input.is_action_pressed("ui_down"):
		set_engine_force(-200)
	if Input.is_action_pressed("ui_left"):
		set_steering(get_steering() - 0.01)
	if Input.is_action_pressed("ui_right"):
		set_steering(get_steering() + 0.01)
