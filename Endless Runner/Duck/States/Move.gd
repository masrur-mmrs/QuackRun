extends GameState

export(float) var gravity
export(float) var jump_speed
export(String) var action
export(bool) var flip_v
export(NodePath) var sprite
export(float) var rotation_speed_degrees
export(float) var rotation_degrees
var floor_height: int
var y_vel: float


func enter():
	_jump()
	if flip_v:
		get_node(sprite).flip_v = true


func physics_process(delta):
	y_vel += gravity
	owner.global_position.y += y_vel * delta
	get_node(sprite).rotation_degrees += rotation_speed_degrees * delta
	if _grounded():
		get_node(sprite).rotation_degrees = 0
		if flip_v:
			get_node(sprite).flip_v = false
		fsm.change_to("Walk")


func input(event: InputEvent):
	if event.is_action_pressed(action):
		_jump()


func _jump():
	get_node(sprite).rotation_degrees = rotation_degrees
	y_vel = jump_speed


func _grounded():
	if owner.global_position.y >= floor_height and gravity > 0:
		return true
	elif owner.global_position.y <= floor_height and gravity < 0:
		return true
	else:
		return false
