extends Node2D

export(Array, PackedScene) var obstacles

export var biased = false
# A number for each obstacle. Higher means more likely, 0 means spawning disabled
export(Array, int) var biases

export var initial_interval_seconds = 3
export var interval_randomness = 0.5

var interval_seconds
var biased_obstacle_list = []


func _enter_tree():
	interval_seconds = initial_interval_seconds
	
	if !biased:
		biased_obstacle_list = obstacles
	else:
		for i in range(len(obstacles)):
			for _j in range(biases[i]):
				biased_obstacle_list.append(obstacles[i])
	
	_spawn_random_obstacle()


func _spawn_random_obstacle():
	var obstacle_instance
	if len(biased_obstacle_list) == 1:
		obstacle_instance = biased_obstacle_list[0].instance()
	else:
		obstacle_instance = biased_obstacle_list[randi() % len(biased_obstacle_list)].instance()
	
	add_child(obstacle_instance)


func _new_timer():
	var min_time = interval_seconds - interval_randomness / 2
	var max_time = interval_seconds + interval_randomness / 2
	var time = rand_range(min_time, max_time)
	$Timer.start(time)


func _on_Timer_timeout():
	_spawn_random_obstacle()
	interval_seconds = initial_interval_seconds * Globals.interval_multiplier
	_new_timer()
