extends KinematicBody2D

const SPEED := 5.0

func _physics_process(delta):
	if Input.is_action_pressed("go_left"):
		move_and_collide(Vector2(-SPEED, 0))
	elif Input.is_action_pressed("go_right"):
		move_and_collide(Vector2(SPEED, 0))
