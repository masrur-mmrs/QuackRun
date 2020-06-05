extends Area2D

export var speed = Vector2(-150, 0)
export(int) var start_height


func _enter_tree():
	position.y = start_height


func _physics_process(delta):
	position += speed * delta
