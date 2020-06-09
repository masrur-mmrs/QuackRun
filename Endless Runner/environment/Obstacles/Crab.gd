extends "res://Environment/Obstacles/StraightLine.gd"

export var start_y_vel = 0
export var gravity_accel = -10
export var ceiling_height = 300

var velocity: Vector2

func _ready():
	velocity = speed


func _physics_process(delta):
	velocity.y += gravity_accel * delta
	if position.y <= ceiling_height and velocity.y < 0:
		velocity.y = -velocity.y
	position += velocity * delta
	
