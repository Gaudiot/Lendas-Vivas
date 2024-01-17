extends CenterContainer

var dragging: bool = false
var offset: Vector2
var init_position: Vector2

@export var item_stored: Item
var item_placeholder: Item = preload("res://Assets/Items/Resources/Placeholder.item.tres")

@onready var inventory: Inventory = preload("res://Misc/PlayerInventory.tres")
@onready var inventory_item_sprite = $InventoryItemArea/InventoryItemPanel/InventoryItemSprite
@onready var inventory_item_area = $InventoryItemArea

func _ready():
	storeItem(item_stored)

func _process(delta):
	if !item_stored:
		return
		
	if Input.is_action_just_pressed("click") and _clickInsideArea():
		dragging = true
		inventory_item_sprite.z_index = 1
		init_position = global_position
		offset = get_global_mouse_position() - global_position
		
	if dragging:
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			dragging = false
			
			var tween = get_tree().create_tween()
			if inventory_item_area.has_overlapping_areas():
				var overlapped_item = inventory_item_area.get_overlapping_areas()[0].owner
				
				if overlapped_item.is_in_group("item") && overlapped_item.item_stored && item_stored.doesItemCombine(overlapped_item.item_stored):
					var crafted_item: Item = item_stored.result_when_combine
					inventory.combine(item_stored, overlapped_item.item_stored, crafted_item)
					
			tween.tween_property(self, "global_position", init_position, 0.2).set_ease(Tween.EASE_OUT)
			inventory_item_sprite.z_index = 0

func _clickInsideArea() -> bool:
	var mouse_position = get_local_mouse_position().abs()
	var area_size = get_transform()[2]/2
	
	if mouse_position[0] > area_size[0]:
		return false
	if mouse_position[1] > area_size[1]:
		return false
	
	return true

func storeItem(item: Item) -> void:
	item_stored = item
	if item:
		$InventoryItemArea/InventoryItemPanel/InventoryItemSprite.texture = item.texture
