extends Node

var player: Area2D
var score: float = 0.0
var score_label: Label
var speed_multiplier setget , _get_speed_mult
var interval_multiplier setget , _get_interval_multiplier
var pitch setget , _get_pitch
var time_since_start := 0.0


func _get_speed_mult():
	return 1/(1 + exp(-(time_since_start / 10 - 5))) * 4 + 1


func _get_interval_multiplier():
	return -(1/(1 + exp(-(time_since_start / 10 - 5))) * 0.5) + 1

func _get_pitch():
	return 1/(1 + exp(-(time_since_start / 10 - 5))) * 0.5 + 1


func bonus_score(bonus_score: int):
	score += bonus_score
	score_label.bonus_animation()
