extends Node2D

@onready var letter = %Letter

@export var portal: Portal

func _ready():
	blockPortal()

func interact(player_interact: Inventory):
	var has_visited_moema: bool = PrologueState.cutscenes_played["MoemaRoom"]
	if not has_visited_moema:
		var dialogue_lines: Array[DialogueLine] = [preload("res://Resources/Dialogues/Prologue/Misc/FailExit_Moema.dialogue.tres")]
		DialogueSystem.startupDialogue(dialogue_lines)
	elif not letter.visible:
		var dialogue_lines: Array[DialogueLine] = [preload("res://Resources/Dialogues/Prologue/Misc/FailExit_Letter.dialogue.tres")]
		DialogueSystem.startupDialogue(dialogue_lines)
	else:
		SceneTransition.swapScene(portal.go_to_scene)
	
func unblockPortal():
	portal.unblockPortal()
	
func blockPortal():
	portal.blockPortal()
	
func setPortalMessage(new_message: String):
	portal.setMessage(new_message)
