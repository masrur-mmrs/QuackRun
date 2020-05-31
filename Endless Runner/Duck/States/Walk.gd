extends GameState

export(NodePath) var sprite
var floor_height: int



func enter():
	get_node(sprite).playing = true
	get_node(sprite).animation = "walk"
	owner.global_position.y = floor_height



func input(event: InputEvent):
	if event.is_action_pressed("jump"):
		get_node(sprite).playing = false
		get_node(sprite).animation = "fly"
		fsm.change_to("Fly")
	elif event.is_action_pressed("dive"):
		get_node(sprite).playing = false
		fsm.change_to("Swim")
