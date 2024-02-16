extends Node2D

@export var collectable: Collectable

@onready var collectable_sprite: Sprite2D = $CollectableSprite
const PLAYER_INVENTORY = preload("res://Misc/PlayerInventory.tres")

func _ready():
	if collectable.has_been_collected:
		queue_free()
	else:
		collectable_sprite.texture = collectable.get_item_texture()
		
func interact():
	collectable.collect()
	PLAYER_INVENTORY.insert(collectable.item)
	queue_free()
