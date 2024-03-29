extends Resource

class_name Inventory

signal updated

@export var items: Array[Item]
var selected_item: Item

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
			
func removeSelectedItem() -> void:
	remove(selected_item)
	selected_item = null
	updated.emit()
			
func combine(item1: Item, item2: Item, result: Item) -> void:
	if selected_item in [item1, item2]:
		selected_item = null
	remove(item1)
	remove(item2)
	insert(result)

func selectItem(item: Item):
	selected_item = item
	updated.emit()
