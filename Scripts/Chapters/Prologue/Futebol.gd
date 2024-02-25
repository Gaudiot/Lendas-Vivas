extends Node2D
	
func interact(player_inventory: Inventory) -> void:
	var soccer_talk = PrologueState.npcs_talked["Soccer"]
	
	if not soccer_talk:
		var dialogue_lines: Array[DialogueLine] = [
			preload("res://Resources/Dialogues/Prologue/Soccer/01_Soccer.dialogue.tres"),
			preload("res://Resources/Dialogues/Prologue/Soccer/02_Soccer.dialogue.tres"),
			preload("res://Resources/Dialogues/Prologue/Soccer/03_Soccer.dialogue.tres"),
			preload("res://Resources/Dialogues/Prologue/Soccer/04_Soccer.dialogue.tres"),
			preload("res://Resources/Dialogues/Prologue/Soccer/05_Soccer.dialogue.tres"),
			preload("res://Resources/Dialogues/Prologue/Soccer/06_Soccer.dialogue.tres"),
			preload("res://Resources/Dialogues/Prologue/Soccer/07_Soccer.dialogue.tres"),
		]
		DialogueSystem.startupDialogue(dialogue_lines)
		
		PrologueState.npcs_talked["Soccer"] = true
