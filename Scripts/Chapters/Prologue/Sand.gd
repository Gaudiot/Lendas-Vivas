extends Sprite2D

var sand_state = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	if not GlobalVariables.blocked_path["sand"]:
		get_parent().queue_free()

func interact(player_inventory: Inventory) -> void:
	var selected_item: Item = player_inventory.selected_item
	
	if selected_item && selected_item.name == "Shovel":
		match sand_state:
			1:
				sand_state = 0
				frame = 0
			0:
				player_inventory.removeSelectedItem()
				GlobalVariables.blocked_path["sand"] = false
				get_parent().queue_free()
