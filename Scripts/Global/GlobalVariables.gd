extends Node

var items_on_ground: Dictionary = {
	"paper": true,
	"pen": true,
	"stick": true
}

func isItemOnGround(item_name: String) -> bool:
	return items_on_ground[item_name.to_lower()]

func pickItem(item_name: String) -> void:
	items_on_ground[item_name.to_lower()] = false

var blocked_path: Dictionary = {
	"gridwall": true,
	"dog": true
}

func isPathBlocked(obstacle_name: String) -> bool:
	return blocked_path[obstacle_name.to_lower()]
	
func unblockPath(obstacle_name: String) -> void:
	blocked_path[obstacle_name] = false
	