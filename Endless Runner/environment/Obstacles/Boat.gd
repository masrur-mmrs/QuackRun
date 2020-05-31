extends Area2D

export var speed = Vector2(-10, 0)


func _physics_process(delta):
	position += speed * delta
