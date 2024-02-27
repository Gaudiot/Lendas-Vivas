extends Node2D

const MONEY_ITEM = preload("res://Resources/Items/Money.item.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(player_inventory: Inventory) -> void:
	if Section3State.npcs_talked["Butcher"]:
		return
		
	var selected_item = player_inventory.selected_item
	var talked_to_hiolanda = PrologueState.npcs_talked["Hiolanda"]
	var dialogue_lines: Array[DialogueLine] = []
	
	if selected_item && selected_item.name == "Wallet":
		dialogue_lines = [
			preload("res://Resources/Dialogues/Section3/HilanaComplete/HilanaComplete.dialogue.tres")
		]
		
		DialogueSystem.startupDialogue(dialogue_lines)
		Section3State.npcs_talked["Hilana"] = true
		player_inventory.removeSelectedItem()
		player_inventory.insert(MONEY_ITEM)
		return
	
	if talked_to_hiolanda:
		dialogue_lines = [
			preload("res://Resources/Dialogues/Section3/Hilana/01_Hilana.dialogue.tres")
		]
		
		DialogueSystem.startupDialogue(dialogue_lines)
		return
		
	dialogue_lines = [
		preload("res://Resources/Dialogues/Section3/HilanaInit/01_HilanaInit.dialogue.tres")
	]
	
	DialogueSystem.startupDialogue(dialogue_lines)
