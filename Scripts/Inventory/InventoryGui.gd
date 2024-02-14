extends Control

signal opened
signal closed

var is_open: bool = false

@onready var inventory: Inventory = preload("res://Misc/PlayerInventory.tres")
@onready var inventorySlots: Array = %InventorySlots.get_children()

func _ready():
	inventory.updated.connect(update)
	update()
	close()

func update():
	for i in range(min(inventory.items.size(), inventorySlots.size())):
		var item: Item = inventory.items[i]
		var isItemSelected: bool = (inventory.selected_item != null and item == inventory.selected_item)
		inventorySlots[i].update(item, isItemSelected)

func toggle():
	if is_open:
		close()
	else:
		open()

func open():
	show()
	is_open = true
	opened.emit()
	
func close():
	hide()
	is_open = false
	closed.emit()
