extends KinematicBody2D

const SPEED := 3

func _process(delta):
	if Input.is_action_pressed("go_left"):
		self.move_and_collide(Vector2(-SPEED, 0))
	elif Input.is_action_pressed("go_right"):
		self.move_and_collide(Vector2(SPEED, 0))
