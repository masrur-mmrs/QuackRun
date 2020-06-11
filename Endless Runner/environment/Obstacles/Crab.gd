extends "res://environment/Obstacles/StraightLine.gd"

export var start_y_vel = -300
export var gravity_accel = 10
export var floor_height = 430

var velocity: Vector2

func _ready():
	velocity = speed


func _physics_process(delta):
	velocity.y += gravity_accel * delta
	if position.y >= floor_height and velocity.y > 0:
		velocity.y = -velocity.y
	position += velocity * delta

