extends Node

var player: Area2D
var score: float = 0.0
var score_label: Label


func bonus_score(bonus_score: int):
	score += bonus_score
	score_label.bonus_animation()
