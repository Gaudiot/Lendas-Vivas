extends CanvasLayer

@onready var player = $"../Player"
@onready var inventory_gui = $InventoryGui
@onready var player_interact_area: Area2D = $"../Player/PlayerInteractArea"

func _ready():
	show()

func _on_inventory_button_button_down():
	inventory_gui.toggle()
