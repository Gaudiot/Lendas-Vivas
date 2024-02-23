extends Resource

class_name Collectable

@export var item: Item

func get_item_texture() -> Texture2D:
	if item:
		return item.texture
	return null
