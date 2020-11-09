extends Node2D


func _input(_event):
	if _event.is_action_pressed('enter'):
		get_tree().change_scene("res://src/TitleScreen.tscn")
