extends Node2D

@onready var audio_player = %AudioPlayer

@export var portal: Portal
var knocked: bool = false

func _ready():
	unblockPortal()

func interact(player_inventory: Inventory):
	var played_moema_cutscene: bool = PrologueState.cutscenes_played["MoemaRoom"]
	if not played_moema_cutscene and not knocked:
		audio_player.stream = preload("res://Assets/Sounds/Misc/Knock.ogg")
		audio_player.play()
		var dialogue_lines: Array[DialogueLine] = [
			preload("res://Resources/Dialogues/Prologue/Misc/KnockMoema.dialogue.tres")
		]
		DialogueSystem.startupDialogue(dialogue_lines)
		knocked = true
	elif (not portal.is_portal_blocked) and portal.go_to_scene:
		SceneTransition.swapScene(portal.go_to_scene)
	
func unblockPortal():
	portal.unblockPortal()
	
func blockPortal():
	portal.blockPortal()
	
func setPortalMessage(new_message: String):
	portal.setMessage(new_message)
