extends GameState


func input(event: InputEvent):
	if event.is_action("jump"):
		fsm.change_to("Fly")
	elif event.is_action("dive"):
		fsm.change_to("Swim")
