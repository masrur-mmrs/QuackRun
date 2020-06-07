extends Control

export(String) var main_scene_path

func _ready():
	print("Be in MainMenu")
	pass

func _process(delta):
	if Input.is_action_just_pressed("Start"):
		print("load World")
		get_tree().change_scene("res://MainScenes//World.tscn")
