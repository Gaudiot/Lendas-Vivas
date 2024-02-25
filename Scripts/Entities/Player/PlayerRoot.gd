extends Node2D

@onready var player = $Player

@export var play_can_move: bool = true
@export var is_movement_only_horizontal: bool = true
@export var player_speed: float = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	player.is_movement_only_horizontal = is_movement_only_horizontal
	player.MAX_SPEED = player_speed
	
func _physics_process(delta: float):
	player.player_can_move = play_can_move
