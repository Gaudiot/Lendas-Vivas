extends Sprite2D

@onready var joystick = $".."

var pressing: bool = false

@export var max_length: int = 150
@export var deadzone: int = 5

func _ready():
	max_length *= get_parent().scale.x

func _process(delta):
	if pressing:	
		if get_global_mouse_position().distance_to(get_parent().global_position) <= max_length:
			global_position = get_global_mouse_position()
		else:
			var dir: Vector2 = get_global_mouse_position() - get_parent().global_position
			global_position = get_parent().global_position + dir.normalized()*max_length
		calculateVector()
	else:
		global_position = lerp(global_position, get_parent().global_position, delta*10)
	
func calculateVector() -> void:
	if abs(global_position.x - get_parent().global_position.x) >= deadzone:
		get_parent().pos_vector.x = (global_position.x - get_parent().global_position.x)/max_length
	if abs(global_position.y - get_parent().global_position.y) >= deadzone:
		get_parent().pos_vector.y = (global_position.y - get_parent().global_position.y)/max_length

func _on_button_button_down():
	pressing = true

func _on_button_button_up():
	pressing = false
	get_parent().pos_vector = Vector2(0, 0)
