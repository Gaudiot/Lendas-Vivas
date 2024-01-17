extends Panel

@onready var inventory_slot_sprite: Sprite2D = %InventorySlotSprite
@onready var inventory_item = $InventoryItem

func update(item: Item):
	inventory_item.storeItem(item)
	if !item:
		inventory_slot_sprite.frame = 0
		$InventoryItem.visible = false
	else:
		inventory_slot_sprite.frame = 1
		$InventoryItem.visible = true
