extends Node2D

@onready var audio_player_nightmare = $AudioPlayerNightmare

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func playSnake():
	audio_player_nightmare.stream = preload("res://Assets/Backgrounds/Chapters/Prologue/InaraRoom.png")
	audio_player_nightmare.play()

func startGame():	
	SceneTransition.swapScene("res://Scenes/Chapters/Prologue/InaraRoom.tscn")
