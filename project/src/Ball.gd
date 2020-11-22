extends RigidBody2D

export var bricks_broken := 0
onready var GameUI = $"/root/Background/GameUI"

func _on_Ball_body_exited(_body):
	if _body.has_method("hit"):
		_body.hit()
		bricks_broken += 1
		if bricks_broken > 35:
			var Background = get_parent()
			GameUI.score += 50 * (Background.level+1)
			Background.level += 1
			Background._setup_level()
			queue_free()
	elif _body.has_method("gameover"): # Bottom
		_body.gameover()
	
	var _random_x := (randf()-0.5) * 20.0
	var _random_y := (randf()-0.5) * 20.0
	apply_impulse(Vector2.ZERO, Vector2(_random_x, _random_y))
