extends CanvasLayer

@onready var inventory_gui = $InventoryGui

@export var player_inventory: Inventory

func _ready():
	#inventory_gui.close()
	pass

func _on_inventory_button_pressed():
	inventory_gui.toggle()

func _on_interact_button_pressed():
	var paper = preload("res://Assets/Items/Resources/Paper.item.tres")
	#player_inventory.insert(paper)
