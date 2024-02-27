extends Node2D

@onready var animation_player = %AnimationPlayer

@onready var pisadeira_1_area = %Pisadeira1Area
@onready var pisadeira_2_area = %Pisadeira2Area

func _ready():
	if PrologueState.cutscenes_played["PisadeiraEncounter"]:
		pisadeira_1_area.queue_free()
	if PrologueState.cutscenes_played["PisadeiraReencounter"]:
		pisadeira_2_area.queue_free()

func pisadeiraEncounter(area2d: Area2D):
	animation_player.play("PisadeiraFirstEncounter")
	PrologueState.cutscenes_played["PisadeiraEncounter"] = true
	pisadeira_1_area.queue_free()
	
func pisadeiraReencounter(area2d: Area2D):
	animation_player.play("PisadeiraReencounter")
	PrologueState.cutscenes_played["PisadeiraReencounter"] = true
	pisadeira_2_area.queue_free()
