extends "res://Environment/Obstacles/StraightLine.gd"

export var score = 15
export var remove_on_use = true


func _on_area_entered(area):
	if area.is_in_group("duck"):
		Globals.bonus_score(score)
	if remove_on_use:
		queue_free()
