extends Node2D

@onready var animation_player = %AnimationPlayer

@onready var pisadeira_1_area = %Pisadeira1Area

func pisadeiraEncounter(area2d: Area2D):
	animation_player.play("PisadeiraFirstEncounter")
	pisadeira_1_area.queue_free()
