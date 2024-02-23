extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	
	var is_letter_at_table: bool = PrologueState.itemsUsed["Letter"]
	if is_letter_at_table:
		show()

func interact(player_inventory: Inventory):
	print("Interact")
	if visible:
		return
	
	if player_inventory.selected_item && player_inventory.selected_item.name == "Letter":
		PrologueState.itemsUsed["Letter"] = true
		player_inventory.removeSelectedItem()
		show()
