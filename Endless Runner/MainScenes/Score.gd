extends Label

func _enter_tree():
	var high_score = int(_read_from_file())
	if Globals.score > high_score:
		high_score = int(Globals.score)
		_save_to_file(str(high_score))
	text = str(high_score)

func _read_from_file():
	var file = File.new()
	file.open("user://high_score.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	return content

func _save_to_file(content):
	var file = File.new()
	file.open("user://high_score.txt", File.WRITE)
	file.store_string(content)
	file.close()
