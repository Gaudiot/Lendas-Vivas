extends Node

const Dialogue = preload("res://Scripts/Entities/Dialogue.gd")

var dialogues = []
var dialogue = ""
var visible_character = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func setup_dialogue(dialogues: Array[Dialogue]):
	self.dialogues = dialogues
	_setup_dialogue_box()
	
func _setup_dialogue_box():
	visible_character = 0
	dialogue = dialogues.pop_front()
	
	var is_image_left = dialogue.is_image_left;
	if is_image_left:
		%DialogueLeftCharacter.show()
		%DialogueRightCharacter.hide()
	else:
		%DialogueLeftCharacter.hide()
		%DialogueRightCharacter.show()
		
	var character_name = dialogue.character
	%DialogueCharacterName.text = character_name
	
	$DialogueVoiceSound.stream = load(dialogue.sound_path)
	$DialogueVoiceSound.play()
	
	$DialogueTimer.start()
	
func next_text():
	if visible_character < dialogue.text.length():
		visible_character = dialogue.text.length()
		update_text()
		return
		
	if dialogues.is_empty():
		queue_free()
		return
	
	_setup_dialogue_box()
	
func update_text():
	%DialogueText.text = dialogue.text.left(visible_character)
	
func _on_dialogue_timer_timeout():
	if visible_character == dialogue.text.length():
		$DialogueTimer.stop()
		return
		
	visible_character += 1
	update_text()
	
func _on_dialogue_continue_button_pressed():
	next_text()
