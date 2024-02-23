extends Node2D

@export var collectable: Collectable

@onready var collectable_sprite: Sprite2D = $CollectableSprite
const PLAYER_INVENTORY = preload("res://Misc/PlayerInventory.tres")

func _ready():
	var is_item_on_ground: bool = GlobalVariables.isItemOnGround(collectable.item.name)
	if is_item_on_ground:
		collectable_sprite.texture = collectable.get_item_texture()
	else:
		queue_free()
		
func interact(player_inventory: Inventory):
	GlobalVariables.pickItem(collectable.item.name)
	player_inventory.insert(collectable.item)
	queue_free()
