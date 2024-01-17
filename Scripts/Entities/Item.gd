extends Resource

class_name Item

@export var id: String
@export var name: String = ""
@export var texture: Texture2D

@export var combine_with_item_id: String
@export var result_when_combine: Item

func doesItemCombine(item: Item) -> bool:
	return item.id == combine_with_item_id
