extends "res://environment/Obstacles/StraightLine.gd"

export var score = 15
export var remove_on_use = true
export var min_y = 5.0
export var max_y = 550.0

func _enter_tree():
	speed = start_speed
	position.y = rand_range(min_y, max_y)


func _on_area_entered(area):
	if area.is_in_group("duck"):
		Globals.bonus_score(score)
	if remove_on_use:
		queue_free()
