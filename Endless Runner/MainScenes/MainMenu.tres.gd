extends Control

export(String) var main_scene_path


func input(event: InputEvent):
	if event.is_action_pressed("play"):
		get_tree().change_scene(main_scene_path)
