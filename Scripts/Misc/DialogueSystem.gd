extends CanvasLayer

# CHARACTER NODES
@onready var char_left: TextureRect = $DialogueBox/Characters/CharLeft
@onready var char_right: TextureRect = $DialogueBox/Characters/CharRight

# TEXT NODES
@onready var dialogue_button = $DialogueBox/DialogueButton
@onready var char_name_label = %CharName
@onready var dialogue_text = %DialogueText

# AUXILIAR NODES
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var dialogue_audio_player = $DialogueAudioPlayer

@export var dialogue_lines: Array[DialogueLine] = []
var current_line: String = ""
var char_name: String = ""
var text_displayed: String = ""
var visible_letters: int = 0

var teste: bool = false
func _ready():
	if teste:
		print("Chamou _ready")
		startupDialogue(dialogue_lines)

func startupDialogue(new_dialogue_lines: Array[DialogueLine]):
	dialogue_lines = new_dialogue_lines
	animation_player.play("StartDialogue")
	_startDialogue()

func _getNextLine():
	var next_dialogue_line: DialogueLine = dialogue_lines.pop_front()
	char_name = next_dialogue_line.char_name
	current_line = next_dialogue_line.line
	visible_letters = 0
	text_displayed = ""
	
	if next_dialogue_line.is_char_left:
		char_left.texture = next_dialogue_line.char_image
		char_left.show()
		char_right.hide()
	else:
		char_right.texture = next_dialogue_line.char_image
		char_left.hide()
		char_right.show()
	
	dialogue_audio_player.stream = next_dialogue_line.char_sound

func _startDialogue():
	_getNextLine()
	_updateText()

func _endDialogue():
	animation_player.play("EndDialogue")
	timer.stop()

func _dialoguePressed():
	if visible_letters == current_line.length():
		if dialogue_lines.is_empty():
			_endDialogue()
			return
		
		_getNextLine()
	else:
		visible_letters = current_line.length()
		text_displayed = current_line
		
	_updateText()

func _showNextLetter():
	if visible_letters == current_line.length():
		timer.stop()
		return
		
	visible_letters += 1
	if visible_letters < current_line.length() && current_line[visible_letters] != " ":
		dialogue_audio_player.play()
	text_displayed = current_line.left(visible_letters)
	_updateText()

func _updateText():
	dialogue_text.text = text_displayed
	char_name_label.text = char_name
	timer.start()
