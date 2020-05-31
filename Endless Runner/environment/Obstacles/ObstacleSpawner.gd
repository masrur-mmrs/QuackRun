extends Node2D

export(Array, PackedScene) var obstacles
export var interval_seconds = 3
export var interval_randomness = 0.5

func _enter_tree():
	_spawn_random_obstacle()


func _spawn_random_obstacle():
	var obstacle_instance
	if len(obstacles) == 1:
		obstacle_instance = obstacles[0].instance()
	else:
		obstacle_instance = obstacles[randi() % len(obstacles)].instance
	
	add_child(obstacle_instance)


func _new_timer():
	var min_time = interval_seconds - interval_randomness / 2
	var max_time = interval_seconds + interval_randomness / 2
	var time = rand_range(min_time, max_time)
	$Timer.start(time)


func _on_Timer_timeout():
	_spawn_random_obstacle()
	_new_timer()
