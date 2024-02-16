extends Resource

class_name Collectable

var has_been_collected: bool = false
@export var item: Item

func collect():
	has_been_collected = true

func get_item_texture() -> Texture2D:
	if item:
		return item.texture
	return null
