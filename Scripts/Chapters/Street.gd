extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func pisadeiraFirstEncounterDialogue() -> void :
	var dialogue_lines: Array[DialogueLine] = [
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/01_PisadeiraEncounter.dialogue.tres"),
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/02_PisadeiraEncounter.dialogue.tres"),
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/03_PisadeiraEncounter.dialogue.tres"),
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/04_PisadeiraEncounter.dialogue.tres"),
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/05_PisadeiraEncounter.dialogue.tres"),
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/06_PisadeiraEncounter.dialogue.tres"),
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/07_PisadeiraEncounter.dialogue.tres"),
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/08_PisadeiraEncounter.dialogue.tres"),
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/09_PisadeiraEncounter.dialogue.tres"),
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/10_PisadeiraEncounter.dialogue.tres"),
		preload("res://Resources/Dialogues/Section2/PisadeiraEncounter/11_PisadeiraEncounter.dialogue.tres")
	]
	DialogueSystem.startupDialogue(dialogue_lines)
