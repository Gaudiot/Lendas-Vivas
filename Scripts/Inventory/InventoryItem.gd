extends CenterContainer

var dragging: bool = false
var offset: Vector2
var init_position: Vector2

@export var item_stored: Item

@onready var inventory: Inventory = preload("res://Misc/PlayerInventory.tres")
@onready var inventory_item_sprite: TextureRect = $InventoryItemArea/InventoryItemPanel/InventoryItemSprite
@onready var inventory_item_area: Area2D = $InventoryItemArea

func _ready():
	storeItem(item_stored)

func _process(delta):
	if !item_stored:
		return
		
	if dragging:
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			dragging = false
			
			if init_position.distance_squared_to(global_position) < 1:
				_selectItem()
			elif inventory_item_area.has_overlapping_areas():
				_mergeItems()
					
			var tween = get_tree().create_tween()
			tween.tween_property(self, "global_position", init_position, 0.2).set_ease(Tween.EASE_OUT)
			inventory_item_sprite.z_index = 0

func _isClickInsideArea(viewport, event, shapeidx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		dragging = true
		inventory_item_sprite.z_index = 1
		init_position = global_position
		offset = get_global_mouse_position() - global_position
		
func _selectItem():
	inventory.selectItem(item_stored)
		
func _mergeItems():
	var overlapped_items_area: Array[Area2D] = inventory_item_area.get_overlapping_areas()
	var nearest_item = null
	
	var shortest_distance: float = INF
	for item_area in overlapped_items_area:
		if !item_area.owner.item_stored:
			continue
		var item_distance = inventory_item_area.global_position.distance_squared_to(item_area.global_position)
		if (item_distance < shortest_distance):
			nearest_item = item_area.owner
			shortest_distance = item_distance
			
	if nearest_item:
		if nearest_item.is_in_group("item") && nearest_item.item_stored && item_stored.doesItemCombine(nearest_item.item_stored):
			var crafted_item: Item = item_stored.result_when_combine
			inventory.combine(item_stored, nearest_item.item_stored, crafted_item)

func storeItem(item: Item) -> void:
	item_stored = item
	if item:
		inventory_item_area.monitorable = true
		$InventoryItemArea/InventoryItemPanel/InventoryItemSprite.texture = item.texture
	else:
		inventory_item_area.monitorable = true
		$InventoryItemArea/InventoryItemPanel/InventoryItemSprite.texture = null
