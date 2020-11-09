extends RigidBody2D

var bricks_broken := 0

func _on_Ball_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		bricks_broken += 1
		if bricks_broken > 35:
			get_tree().change_scene("res://src/win.tscn")
	elif body.has_method("gameover"):
		body.gameover()

