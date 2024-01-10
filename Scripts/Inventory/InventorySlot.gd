extends Panel

@onready var inventory_slot_sprite: Sprite2D = %InventorySlotSprite
@onready var inventory_item = $InventoryItem

func update(item: Item):
	if !item:
		inventory_slot_sprite.frame = 0
		inventory_item.visible = false
	else:
		inventory_slot_sprite.frame = 1
		inventory_item.visible = true
		#inventoryItemSprite.texture = item.texture
