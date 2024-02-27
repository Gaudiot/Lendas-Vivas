extends Node2D

const MEAT_ITEM: Item = preload("res://Resources/Items/Meat.item.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(player_inventory: Inventory) -> void:
	if Section3State.npcs_talked["Butcher"]:
		return
		
	var selected_item = player_inventory.selected_item
	var talked_to_hiolanda = PrologueState.npcs_talked["Hiolanda"]
	var dialogue_lines: Array[DialogueLine] = []
	
	if selected_item && selected_item.name == "Money":
		dialogue_lines = [
			preload("res://Resources/Dialogues/Section3/ButcherMoney/01_ButcherMoney.dialogue.tres")
		]
		
		DialogueSystem.startupDialogue(dialogue_lines)
		Section3State.npcs_talked["Butcher"] = true
		player_inventory.removeSelectedItem()
		player_inventory.insert(MEAT_ITEM)
		return
	
	if talked_to_hiolanda:
		dialogue_lines = [
			preload("res://Resources/Dialogues/Section3/Butcher/01_Butcher.dialogue.tres"),
			preload("res://Resources/Dialogues/Section3/Butcher/02_Butcher.dialogue.tres"),
			preload("res://Resources/Dialogues/Section3/Butcher/03_Butcher.dialogue.tres"),
			preload("res://Resources/Dialogues/Section3/Butcher/04_Butcher.dialogue.tres"),
			preload("res://Resources/Dialogues/Section3/Butcher/05_Butcher.dialogue.tres"),
		]
		
		DialogueSystem.startupDialogue(dialogue_lines)
		return
		
	dialogue_lines = [
		preload("res://Resources/Dialogues/Section3/ButcherInit/01_ButcherInit.dialogue.tres"),
		preload("res://Resources/Dialogues/Section3/ButcherInit/02_ButcherInit.dialogue.tres"),
		preload("res://Resources/Dialogues/Section3/ButcherInit/03_ButcherInit.dialogue.tres")
	]
	
	DialogueSystem.startupDialogue(dialogue_lines)
