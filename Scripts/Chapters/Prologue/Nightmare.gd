extends Node2D

@onready var audio_player_nightmare = $AudioPlayerNightmare
@onready var audio_player_moema = %AudioPlayerMoema
	
func playSnake():
	audio_player_nightmare.stream = preload("res://Assets/Sounds/Characters/Snake.ogg")
	audio_player_nightmare.play()
	
func playAnhanga():
	audio_player_nightmare.stream = preload("res://Assets/Sounds/Characters/Anhanga.ogg")
	audio_player_nightmare.play()
	
func playMoema():
	audio_player_moema.play()

func startGame():	
	SceneTransition.swapScene("res://Scenes/Chapters/Prologue/InaraRoom.tscn")
