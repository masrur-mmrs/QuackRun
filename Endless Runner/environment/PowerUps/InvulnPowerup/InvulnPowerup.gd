extends "res://Environment/Obstacles/StraightLine.gd"


func _on_InvulnPowerup_area_entered(area):
	if area.is_in_group("duck"):
		if area.has_method("become_invuln"):
			area.become_invuln()
			queue_free()
