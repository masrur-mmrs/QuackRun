extends Node


func _process(_delta) -> void:
	self.material.set_shader_param("scroll_speed", $"..".scroll_speed)

