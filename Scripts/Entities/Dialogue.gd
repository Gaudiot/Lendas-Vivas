class_name Dialogue
var text: String
var character: String
var is_image_left: bool
var sound_path: String

	# Construtor
func _init(text: String, character: String, is_image_left: bool, sound_path: String):
	self.text = text
	self.character = character
	self.is_image_left = is_image_left
	self.sound_path = sound_path
