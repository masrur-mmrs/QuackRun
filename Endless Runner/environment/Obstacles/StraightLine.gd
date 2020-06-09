extends Area2D

export var start_speed = Vector2(-150, 0)
export(int) var start_height

var speed: Vector2


func _enter_tree():
	speed = start_speed
	position.y = start_height + 11


func _process(delta):
	speed = start_speed * Globals.speed_multiplier


func _physics_process(delta):
	position += speed * delta
