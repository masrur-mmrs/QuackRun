extends GameState

export(String) var animation
export(float) var gravity
export(float) var jump_speed
export(String) var action
export(bool) var flip_v
export(NodePath) var sprite
export(float) var rotation_speed_degrees
export(float) var rotation_degrees
export(float) var max_y = 600
export(float) var min_y = 0
var floor_height: int
var y_vel: float
onready var quack = $AudioStreamPlayer

func enter():
	_jump()
	if flip_v:
		get_node(sprite).flip_v = true
	get_node(sprite).animation = animation


func physics_process(delta):
	y_vel += gravity
	
	_clamp_velocity()
	
	owner.global_position.y += y_vel * delta
#	owner.global_position.y += clamp(y_vel * delta, min_y, max_y)
	get_node(sprite).rotation_degrees += rotation_speed_degrees * delta
	if _grounded():
		get_node(sprite).rotation_degrees = 0
		if flip_v:
			get_node(sprite).flip_v = false
		fsm.change_to("Walk")


func input(event: InputEvent):
	if event.is_action_pressed(action):
		quack.play()
		_jump()


func _jump():
	get_node(sprite).rotation_degrees = rotation_degrees
	y_vel = jump_speed
	_clamp_velocity()


func _grounded():
	if owner.global_position.y >= floor_height and gravity > 0:
		return true
	elif owner.global_position.y <= floor_height and gravity < 0:
		return true
	else:
		return false


func _clamp_velocity():
	var y_pos = owner.global_position.y
	if (y_pos > max_y and y_vel > 0) or (y_pos < min_y and y_vel < 0):
		y_vel = 0
