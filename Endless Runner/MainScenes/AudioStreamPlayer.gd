extends AudioStreamPlayer

var boolean
var GLOBAL

func _ready():
	self.stream = load("res://Audio//background_music.wav")
	self.play(GLOBAL.timecode)
	
func _process(delta):
	GLOBAL.timecode = self.get_playback_position()
