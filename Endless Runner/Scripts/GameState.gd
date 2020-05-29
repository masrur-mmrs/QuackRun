extends Node
class_name GameState

var fsm: StateMachine

func enter():
	pass

# Optional handler functions for game loop events
func process(delta):
	return delta

func physics_process(delta):
	return delta

func input(event):
	return event

func unhandled_input(event):
	return event

func unhandled_key_input(event):
	return event
