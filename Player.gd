extends Vehicle

func _vehicle_process(delta):
	._vehicle_process(delta)
	if Input.is_action_pressed("ui_up"):
		set_engine_force(500)
	if Input.is_action_pressed("ui_down"):
		set_engine_force(-500)
	if Input.is_action_pressed("ui_left"):
		set_steering(min(PI/4, get_steering() + 0.005))
	if Input.is_action_pressed("ui_right"):
		set_steering(max(-PI/4, get_steering() - 0.005))
	
