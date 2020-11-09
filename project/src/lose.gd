extends Node2D


func _input(_event) -> void:
	if _event.is_action_pressed('enter'):
		var e := get_tree().change_scene("res://src/TitleScreen.tscn")
		if e:
			pass
