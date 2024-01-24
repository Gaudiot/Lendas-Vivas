extends Node

@onready var collectable_indicator = $CollectableIndicator
@export var item: Item

func _ready():
	pass
	
func interact(player_inventory: Inventory) -> void:
	print("interacted")
	player_inventory.selectItem(item)
	queue_free()
	
func _playIndicator() -> void:
	collectable_indicator.playIndicator()
