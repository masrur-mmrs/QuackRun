extends GameState

export(NodePath) var sprite
export var animation = "walk"
var floor_height: int
onready var quack = $AudioStreamPlayer

func enter():
	get_node(sprite).playing = true
	get_node(sprite).animation = animation
	owner.global_position.y = floor_height



func input(event: InputEvent):
	if event.is_action("debug"):
		fsm.change_to("Invuln")
		
	if event.is_action_pressed("jump"):
		fsm.change_to("Fly")
		quack.play()
	elif event.is_action_pressed("dive"):
		fsm.change_to("Swim")
		quack.play()
