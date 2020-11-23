extends RigidBody2D

onready var ScoreLabel = $"/root/Background/ScoreLabel"
onready var LivesLabel = $"/root/Background/LivesLabel"

func _on_Ball_body_exited(_body):
	var Background = get_parent()
	
	var _num_balls := 0
	for child in Background.get_children():
		if child.name == "Ball":
			_num_balls += 1
	var _is_only_ball = _num_balls == 1
	
	if _body.has_method("hit"):
		_body.hit()
		Background.bricks_broken += 1
		if Background.bricks_broken > 35:
			ScoreLabel.score += 50 * (Background.level+1)
			Background.level += 1
			Background._setup_level()
			queue_free()
	elif _body.has_method("gameover"): # Bottom
		if _is_only_ball:
			Background.lives -= 1
			LivesLabel.liveslabel =  Background.lives
			if Background.lives < 1:
				_body.gameover()
			else:
				Background.respawn_ball()
		queue_free()
	
	var _random_x := (randf()-0.5) * 20.0
	var _random_y := (randf()-0.5) * 20.0
	apply_impulse(Vector2.ZERO, Vector2(_random_x, _random_y))
