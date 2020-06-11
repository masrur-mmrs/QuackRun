extends Control

export(String) var main_scene_path


func _input(event):
	if !(event is InputEventMouseMotion):
		get_tree().change_scene("res://MainScenes/World.tscn")
