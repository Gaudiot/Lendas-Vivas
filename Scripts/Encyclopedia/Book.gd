extends Control

signal page_turned(folklore: FolkloreInfo)

@export var folklore_list: Array[FolkloreInfo] = []
var current_page: int = 0

@onready var previous_page = $PreviousPage
@onready var next_page = $NextPage

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_page()
	
func _on_previous_page_button_down():
	print("pressed prev")
	if current_page > 0:
		print("worked prev")
		current_page -= 1
		_update_page()

func _on_next_page_button_down():
	print("pressed next")
	if current_page + 1 < folklore_list.size():
		print("worked next")
		current_page += 1
		_update_page()
		
func _update_page() -> void:
	var is_first_page: bool = (current_page <= 0)
	var is_last_page: bool = (current_page + 1 >= folklore_list.size())
	
	if is_first_page:
		previous_page.hide()
	else:
		previous_page.show()
		
	if is_last_page:
		next_page.hide()
	else:
		next_page.show()
		
	page_turned.emit(folklore_list[current_page])
