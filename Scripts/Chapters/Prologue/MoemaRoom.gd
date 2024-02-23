extends Node2D

@export var cutscene_lines: Array[DialogueLine] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var first_cutscene: bool = PrologueState.cutscenes_played["MoemaRoom"]
	if not first_cutscene:
		_playMoemaRoomCutscene()
		
func _playMoemaRoomCutscene() -> void:
	PrologueState.cutscenes_played["MoemaRoom"] = true
	DialogueSystem.startupDialogue(cutscene_lines)
