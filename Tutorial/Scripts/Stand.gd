extends Sprite2D

@onready var apple = %Apple
@onready var nightmare = %Nightmare

func _ready():
	apple.hide()
	nightmare.blockPortal()

func interact(player_inventory: Inventory) -> void:
	var selected_item: Item = player_inventory.selected_item
	
	if selected_item and selected_item.name == "Apple":
		apple.show()
		nightmare.unblockPortal()
		player_inventory.removeSelectedItem()
