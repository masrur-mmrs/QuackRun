extends "res://environment/Obstacles/StraightLine.gd"

export var min_y = 5.0
export var max_y = 550.0

func _enter_tree():
	speed = start_speed
	position.y = rand_range(min_y, max_y)

func _on_InvulnPowerup_area_entered(area):
	if area.is_in_group("duck"):
		if area.has_method("become_invuln"):
			area.become_invuln()
			queue_free()
