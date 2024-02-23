extends Node2D

@export var cutscene_lines: Array[DialogueLine] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var first_cutscene: bool = PrologueState.cutscenes_played["InaraRoom"]
	if not first_cutscene:
		_playInaraRoomCutscene()
		
func _playInaraRoomCutscene() -> void:
	PrologueState.cutscenes_played["InaraRoom"] = true
	DialogueSystem.startupDialogue(cutscene_lines)
