extends Node2D

@onready var player = $Player

@export var is_movement_only_horizontal: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	player.is_movement_only_horizontal = is_movement_only_horizontal
