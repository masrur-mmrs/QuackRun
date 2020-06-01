extends Area2D

export var score_per_second = 1.0


func _ready():
	Globals.player = self


func _enter_tree():
	for state in $StateMachine.get_children():
		state.floor_height = global_position.y


func _process(delta):
	Globals.score += score_per_second * delta


func _on_area_entered(area):
	if area.is_in_group("obstacle"):
		get_tree().change_scene("res://MainScenes/RetryScreen.tscn")
		
