extends CenterContainer

var dragging: bool = false
var offset: Vector2
var init_position: Vector2

@onready var inventory_item_sprite = %InventoryItemSprite
@onready var inventory_item_area = $InventoryItemArea

func _process(delta):
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
			inventory_item_sprite.z_index = 0
			var tween = get_tree().create_tween()
			if inventory_item_area.has_overlapping_areas():
				var overlapped_item = inventory_item_area.get_overlapping_areas()[0].owner
				if overlapped_item.is_in_group("item"):
					overlapped_item.queue_free()
					queue_free()
					
			tween.tween_property(self, "global_position", init_position, 0.2).set_ease(Tween.EASE_OUT)

func _clickInsideArea():
	var mouse_position = get_local_mouse_position().abs()
	var area_size = get_transform()[2]/2
	
	if mouse_position[0] > area_size[0]:
		return false
	if mouse_position[1] > area_size[1]:
		return false
	
	return true
