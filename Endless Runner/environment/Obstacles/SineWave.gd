extends "res://Environment/Obstacles/StraightLine.gd"

export(float) var amplitude
export(float) var period
export var rotate = false
export var rotation_amplitude = 30.0

var elapsed_time := 0.0


func _physics_process(delta):
	elapsed_time += delta
	position.y = sin(elapsed_time / period) * amplitude + start_height
	if rotate:
		rotation = -cos(elapsed_time / period) * deg2rad(rotation_amplitude)
