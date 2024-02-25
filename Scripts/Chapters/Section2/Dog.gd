extends Sprite2D

@onready var animation_player = %AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func interact(player_inventory: Inventory) -> void:
	var selected_item: Item = player_inventory.selected_item
	
	if selected_item and selected_item.name == "Meat":
		player_inventory.removeSelectedItem()
		animation_player.play("DogLeave")
		return
		
	var dialogue_lines: Array[DialogueLine] = [preload("res://Resources/Dialogues/Section2/Misc/Dog/01_AngryDog.dialogue.tres")]
	DialogueSystem.startupDialogue(dialogue_lines)
	
func deleteDog(anim_name: StringName):
	if anim_name == "DogLeave":
		get_parent().queue_free()
