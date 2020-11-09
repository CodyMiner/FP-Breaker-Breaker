extends Node2D

func _input(event):
	if event.is_action_pressed('enter'):
		get_tree().change_scene("res://src/TitleScreen.tscn")

