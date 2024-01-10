extends Control

signal opened
signal closed

var is_open: bool = false

@onready var inventory: Inventory = preload("res://Misc/PlayerInventory.tres")
@onready var inventorySlots: Array = %InventorySlots.get_children()

func _ready():
	#inventory.updated.connect(update)
	update()

func update():
	#for i in range(min(inventory.items.size(), inventorySlots.size())):
	#	inventorySlots[i].update(inventory.items[i])
	pass

func toggle():
	if is_open:
		close()
	else:
		open()

func open():
	visible = true
	is_open = true
	opened.emit()
	
func close():
	visible = false
	is_open = false
	closed.emit()
