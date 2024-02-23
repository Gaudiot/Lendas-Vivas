extends CanvasLayer

var sceneToLoad

@onready var animation_player = $AnimationPlayer

func swapScene(to):
	sceneToLoad = to
	animation_player.play("scene_unload")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "scene_unload":
		get_tree().change_scene_to_file(sceneToLoad)
		animation_player.play("scene_load")
