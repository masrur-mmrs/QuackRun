extends Area2D

export var speed = Vector2(-150, 0)
export(int) var start_height


func _enter_tree():
	position.y = start_height + 11


func _physics_process(delta):
	position += speed * delta
