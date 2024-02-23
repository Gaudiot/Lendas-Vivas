extends Node2D

@export var is_portal_blocked: bool = false

@export var portal: Portal

func _ready():
	if is_portal_blocked:
		portal.blockPortal()
	else:
		portal.unblockPortal()

func interact(player_inventory: Inventory):
	if (not portal.is_portal_blocked) and portal.go_to_scene:
		SceneTransition.swapScene(portal.go_to_scene)
	
func unblockPortal():
	portal.unblockPortal()
	
func blockPortal():
	portal.blockPortal()
	
func setPortalMessage(new_message: String):
	portal.setMessage(new_message)
