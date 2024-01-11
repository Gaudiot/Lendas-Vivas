extends Resource

class_name Inventory

signal updated

@export var items: Array[Item]

func insert(item: Item) -> void:
	for i in range(items.size()):
		if !items[i]:
			items[i] = item
			break
	updated.emit()
	
func remove(item: Item) -> void:
	for i in range(items.size()):
		if items[i] == item:
			items[i] = null
			break;
			
func combine(item1: Item, item2: Item, result: Item) -> void:
	remove(item1)
	remove(item2)
	insert(result)
