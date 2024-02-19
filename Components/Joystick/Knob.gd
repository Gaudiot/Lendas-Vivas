extends TextureRect

var pressing: bool = false

@export var max_length: int = 256
@export var deadzone: int = 5

var CENTER_VECTOR: Vector2 = Vector2(256, 256)
#const CENTER_VECTOR: Vector2 = Vector2(0, 0)

func _ready():
	#CENTER_VECTOR = vector2(self.size.x/2, self.size.y/2)
	var factor = get_parent().get_parent().scale.x
	CENTER_VECTOR *= factor
	max_length *= factor

func _process(delta):
	if pressing:
		var is_inside_ring: bool = (get_global_mouse_position() - CENTER_VECTOR).distance_to(get_parent().global_position) <= max_length
		print(is_inside_ring)
		print(get_global_mouse_position())
		if is_inside_ring:
			global_position = get_global_mouse_position() - CENTER_VECTOR
		else:
			var dir: Vector2 = (get_global_mouse_position() - CENTER_VECTOR) - get_parent().global_position
			global_position = dir.normalized()* max_length + get_parent().global_position
		calculateVector()
	else:
		global_position = lerp(global_position, get_parent().global_position, delta*10)
	
func calculateVector() -> void:
	if abs(global_position.x - get_parent().global_position.x) >= deadzone:
		get_parent().get_parent().pos_vector.x = (global_position.x - get_parent().global_position.x)/max_length
	if abs(global_position.y - get_parent().global_position.y) >= deadzone:
		get_parent().get_parent().pos_vector.y = (global_position.y - get_parent().global_position.y)/max_length

func _on_button_button_down():
	pressing = true

func _on_button_button_up():
	pressing = false
	get_parent().get_parent().pos_vector = Vector2(0, 0)
