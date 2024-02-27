extends CharacterBody2D

@onready var player_sprite = $PlayerSprite
@onready var player_camera = %PlayerCamera
@onready var player_interact_area = $PlayerInteractArea
@onready var joystick = $"../PlayerUI/Joystick"

@export var player_inventory: Inventory
@export var player_can_move: bool = true
@export var is_movement_only_horizontal: bool = true

var MAX_SPEED = 200.0

func _physics_process(delta):
	var SPEED = MAX_SPEED if player_can_move else 0
	
	var directon = joystick.pos_vector
	var direction_horizontal = directon.x
	if direction_horizontal:
		velocity.x = direction_horizontal * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var direction_vertical = directon.y
	if not is_movement_only_horizontal:
		if direction_vertical:
			velocity.y = direction_vertical * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if abs(velocity.x) + abs(velocity.y) == 0:
		player_sprite.animation = "Idle"
	else:
		player_sprite.animation = "Running"
		
	if velocity.x != 0:
		player_sprite.flip_h = (velocity.x < 0)
		
	move_and_slide()

func interactWithEnvironment() -> void:
	if not player_interact_area.has_overlapping_areas():
		print("found nothing")
		return
	
	var areas: Array[Area2D] = player_interact_area.get_overlapping_areas()
	var nearest_area = areas[0]
	var shortest_distance: float = nearest_area.global_position.distance_to(global_position)
	for area in areas:
		var distance: float = area.global_position.distance_to(global_position)
		if distance < shortest_distance:
			shortest_distance = distance
			nearest_area = area
			
	nearest_area.get_parent().interact(player_inventory)
