extends StaticBody2D


func gameover() -> void:
	var d := get_tree().change_scene("res://src/lose.tscn")
	if d:
		pass
