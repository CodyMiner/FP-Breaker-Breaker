extends RigidBody2D

var _bricks_broken := 0


func _on_Ball_body_entered(_body) -> void:
	if _body.has_method("hit"):
		_body.hit()
		_bricks_broken += 1
		if _bricks_broken > 35:
			get_tree().change_scene("res://src/win.tscn")
	elif _body.has_method("gameover"):
		_body.gameover()
