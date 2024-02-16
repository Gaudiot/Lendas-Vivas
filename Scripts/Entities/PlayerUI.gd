extends CanvasLayer

@onready var player = $"../Player"
@onready var inventory_gui = $InventoryGui
@onready var player_interact_area: Area2D = $"../Player/PlayerInteractArea"

func _on_inventory_button_button_down():
	inventory_gui.toggle()

func _on_interact_button_button_down():
	var collisions: Array[Area2D] = player_interact_area.get_overlapping_areas()
	
	if collisions.size() > 0:
		var body: Area2D = collisions[0]
		body.get_parent().interact()
