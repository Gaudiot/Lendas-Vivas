extends Sprite2D

var traded: bool = false
const APPLE_ITEM = preload("res://Tutorial/Resources/Items/apple.item.tres")

func interact(player_inventory: Inventory) -> void:
	var dialogues_lines: Array[DialogueLine] = []
	var selected_item: Item = player_inventory.selected_item
	if traded:
		dialogues_lines = [
			preload("res://Tutorial/Resources/Dialogues/HiolandaTutorialTraded.dialogue.tres")
		]
	elif selected_item and selected_item.name == "Flower":
		dialogues_lines = [
			preload("res://Tutorial/Resources/Dialogues/HiolandaTutorial.dialogue.tres")
		]
		var traded = true
		player_inventory.removeSelectedItem()
		player_inventory.insert(APPLE_ITEM)
	else:
		dialogues_lines = [
			preload("res://Tutorial/Resources/Dialogues/HiolandaTutorialInit.dialogue.tres")
		]
		
	DialogueSystem.startupDialogue(dialogues_lines)
	
