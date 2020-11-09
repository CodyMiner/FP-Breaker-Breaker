extends KinematicBody2D

const SPEED := 5.0


func _physics_process(_delta):
	var collision_info : KinematicCollision2D
	
	if Input.is_action_pressed("go_left"):
		collision_info = move_and_collide(Vector2(-SPEED, 0))
	elif Input.is_action_pressed("go_right"):
		collision_info =move_and_collide(Vector2(SPEED, 0))
	
	if collision_info:
		pass
