extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func interact(player_inventory: Inventory) -> void:
	var selected_item: Item = player_inventory.selected_item
	
	if selected_item && selected_item.name == "Coffee":
		var dialogue_lines: Array[DialogueLine] = [
			preload("res://Resources/Dialogues/Section2/Hiolanda/01_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/02_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/03_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/04_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/05_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/06_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/07_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/08_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/09_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/10_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/11_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/12_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/13_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/14_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/15_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/16_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/17_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/18_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/19_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/20_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/21_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/22_Hiolanda.dialogue.tres"),
			preload("res://Resources/Dialogues/Section2/Hiolanda/23_Hiolanda.dialogue.tres")
		]
		DialogueSystem.startupDialogue(dialogue_lines)
	pass
