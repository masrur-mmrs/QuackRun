extends Area2D

export var score_per_second = 1.0
var invuln = false

signal show_timer(duration)


func _ready():
	Globals.player = self


func _enter_tree():
	for state in $StateMachine.get_children():
		state.floor_height = global_position.y


func _process(delta):
	Globals.score += score_per_second * delta


func become_invuln():
	$StateMachine.change_to("Invuln")


func _on_area_entered(area):
	if invuln:
		return
	if area.is_in_group("obstacle"):
		get_tree().change_scene("res://MainScenes/RetryScreen.tscn")


func _on_Invuln_entered(duration):
	emit_signal("show_timer", duration)
	get_node("Invul").play()
	invuln = true

func _on_Invuln_exited():
	invuln = false
