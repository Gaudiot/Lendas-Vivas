extends AnimatedSprite2D

func _ready():
	hide()
	connect("animation_finished", hide)
	
func playIndicator():
	show()
	play("Indicator")
