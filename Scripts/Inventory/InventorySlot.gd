extends Panel

@onready var inventory_slot_sprite: Sprite2D = %InventorySlotSprite
@onready var inventory_item = $InventoryItem

func update(item: Item, isItemSelected: bool = false):
	inventory_item.storeItem(item)
	if isItemSelected:
		inventory_slot_sprite.frame = 1
	else:
		inventory_slot_sprite.frame = 0
