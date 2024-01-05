extends Button

const Dialogue = preload("res://Scripts/Entities/Dialogue.gd")
const DIALOGUE_EVENT = preload("res://Misc/DialogueEvent.tscn")

func _on_pressed():
	var dialogue_event = DIALOGUE_EVENT.instantiate()
	var a: Array[Dialogue] = [
		Dialogue.new(
			"Godot é errado, muito complexo.\nPrefiro muito mais a Unity com C# e jogos 3D e assets fáceis de criar\nVou emboraaaa.",
			"Gaudiot",
			true,
			"res://Assets/Sounds/villager-sound.mp3"
		),
		Dialogue.new(
			"Errado é o caraio.\nSe está Achando ruim assim vai embora.",
			"Debby",
			false,
			"res://Assets/Sounds/minecraft_hurt.mp3"
		),
		Dialogue.new(
			"Ninguém te chamou aqui mesmo. E digo mais... NUNCA MAIS LHE MANDAREI RAID",
			"Debby",
			false,
			"res://Assets/Sounds/minecraft_hurt.mp3"
		),
		Dialogue.new(
			"Quero pão de batata e dar TO na debby",
			"LG__3",
			true,
			"res://Assets/Sounds/villager-sound.mp3"
		)
	]
	dialogue_event.setup_dialogue(
		a
	)
	get_parent().add_child(dialogue_event)
