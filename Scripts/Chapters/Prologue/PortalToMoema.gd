extends Node2D

@onready var audio_player = %AudioPlayer

@export var portal: Portal
var knocked: bool = false

func _ready():
	blockPortal()

func interact(player_inventory: Inventory):
	if not knocked:
		audio_player.stream = preload("res://Assets/Sounds/Misc/Knock.ogg")
		audio_player.play()
		var dialogue_lines: Array[DialogueLine] = [
			preload("res://Resources/Dialogues/Prologue/Misc/KnockMoema.dialogue.tres")
		]
		DialogueSystem.startupDialogue(dialogue_lines)
		knocked = true
	if (not portal.is_portal_blocked) and portal.go_to_scene:
		SceneTransition.swapScene(portal.go_to_scene)
		
	unblockPortal()
	
func unblockPortal():
	portal.unblockPortal()
	
func blockPortal():
	portal.blockPortal()
	
func setPortalMessage(new_message: String):
	portal.setMessage(new_message)
