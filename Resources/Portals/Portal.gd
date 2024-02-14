extends Resource

class_name Portal

@export var go_to_scene: String
@export var is_portal_blocked: bool = false
@export_multiline var blocked_message: String = "Ainda não é possível explorar essa nova área"

func blockPortal():
	is_portal_blocked = true
	
func unblockPortal():
	is_portal_blocked = false
	
func setMessage(new_message: String):
	blocked_message = new_message
