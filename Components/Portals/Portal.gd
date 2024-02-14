extends Node2D

@export var portal: Portal

func interact():
	if (not portal.is_portal_blocked) and portal.go_to_scene:
		SceneTransition.swapScene(portal.go_to_scene)
		
func unblockPortal():
	portal.unblockPortal()
	
func blockPortal():
	portal.blockPortal()
	
func setPortalMessage(new_message: String):
	portal.setMessage(new_message)
