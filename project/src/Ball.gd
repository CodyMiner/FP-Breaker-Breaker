extends RigidBody2D

var _bricks_broken := 0


func _on_Ball_body_entered(_body) -> void:
	if _body.has_method("hit"):
		_body.hit()
		_bricks_broken += 1
		if _bricks_broken > 35:
			var _c := get_tree().change_scene("res://src/Win.tscn")
			if _c:
				pass
	elif _body.has_method("gameover"):
		_body.gameover()
	
	var _random_x := (randf()-0.5) * 20.0
	var _random_y := (randf()-0.5) * 20.0
	apply_impulse(Vector2.ZERO, Vector2(_random_x, _random_y))
