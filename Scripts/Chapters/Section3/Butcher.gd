extends Node2D

const MEAT_ITEM: Item = preload("res://Resources/Items/Meat.item.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(player_inventory: Inventory) -> void:
	var selected_item = player_inventory.selected_item
	
	if selected_item && selected_item.name == "Money":
		var dialogue_lines: Array[DialogueLine] = [preload("res://Resources/Dialogues/Section3/ButcherMoney/01_ButcherMoney.dialogue.tres")]
		
		DialogueSystem.startupDialogue(dialogue_lines)
		player_inventory.removeSelectedItem()
		player_inventory.insert(MEAT_ITEM)
	
	var dialogue_lines: Array[DialogueLine] = []
	
	DialogueSystem.startupDialogue(dialogue_lines)
