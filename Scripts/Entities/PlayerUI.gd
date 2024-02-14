extends CanvasLayer

@onready var player = $"../Player"
@onready var inventory_gui = $InventoryGui

func _on_inventory_button_button_down():
	print("Pressed inventory button")
	inventory_gui.toggle()

func _on_interact_button_button_down():
	player.interactWithEnvironment()
