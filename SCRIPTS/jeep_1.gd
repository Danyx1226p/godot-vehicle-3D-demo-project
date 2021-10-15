extends VehicleBody

var max_engine_force = 1000.0
var max_braking_force = 12
var max_steering_angle = deg2rad(40)

var engine_speed = 3
var braking_speed = 10
var steering_speed = 2



func _physics_process(delta):
	
	# forward engine force
	if Input.is_action_pressed("ui_up"):
		engine_force = max_engine_force * engine_speed * delta
		
		
	if Input.is_action_just_released("ui_up"):
		engine_force = 0
		
		
		
	# backword engine force
	if Input.is_action_pressed("ui_down"):
		engine_force = -max_engine_force * engine_speed * delta
		
		
	if Input.is_action_just_released("ui_down"):
		engine_force = 0
		
		
		
	# braking force
	if Input.is_action_pressed("ui_accept"):
		
		$VehicleWheel.use_as_traction = false
		$VehicleWheel2.use_as_traction = false
		brake = max_braking_force * braking_speed * delta
		
	if Input.is_action_just_released("ui_accept"):
		
		$VehicleWheel.use_as_traction = true
		$VehicleWheel2.use_as_traction = true
		brake = 0
		
		
	var steer_input = Input.get_action_strength("ui_left")-Input.get_action_strength("ui_right")
	steering = lerp_angle(steering,steer_input*max_steering_angle,steering_speed*delta)  
	
	
	
	
	
	
	
	
	
