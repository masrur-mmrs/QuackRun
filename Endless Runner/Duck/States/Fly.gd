extends GameState

export var gravity = 10.0
export(int) var floor_height
export var jump_speed = 10
var y_vel: float


func enter():
	y_vel = jump_speed


func physics_process(delta):
	y_vel += gravity
	owner.global_position.y += y_vel * delta
	if owner.global_position.y >= floor_height:
		fsm.change_to("Walk")
	
