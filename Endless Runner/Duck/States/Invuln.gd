extends GameState

export(float) var duration = 3.0

var inside_obstacle = false

# This isnt used but removing will destroy EVERYTHING
var floor_height

signal entered(duration)
signal exited

func enter():
	$Timer.start(duration)
	emit_signal("entered", duration)


func physics_process(_delta):
	if !$Timer.is_stopped():
		return
	if !inside_obstacle:
		emit_signal("exited")
		fsm.back()


# Signal connections
func _on_Duck_area_entered(area):
	if area.is_in_group("obstacle"):
		inside_obstacle = true


func _on_Duck_area_exited(area):
	if area.is_in_group("obstacle"):
		inside_obstacle = false
