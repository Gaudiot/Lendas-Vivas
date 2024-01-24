extends CanvasLayer

@onready var player = $"../Player"

func _on_inventory_button_button_down():
	print("Pressed inventory button")

func _on_interact_button_button_down():
	player.interactWithEnvironment()
