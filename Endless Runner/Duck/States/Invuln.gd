extends GameState

export(float) var duration = 3.0

var inside_obstacle = false

# This isnt used but removing will destroy EVERYTHING
var floor_height


func enter():
	$Timer.start(duration)


func physics_process(_delta):
	print($Timer.time_left)
	if !$Timer.is_stopped():
		return
	if !inside_obstacle:
		fsm.back()


# Signal connections
func _on_Duck_area_entered(area):
	if area.is_in_group("obstacle"):
		inside_obstacle = true


func _on_Duck_area_exited(area):
	if area.is_in_group("obstacle"):
		inside_obstacle = false
