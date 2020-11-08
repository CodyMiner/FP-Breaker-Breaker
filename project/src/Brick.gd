extends Area2D

func _on_Bricks_body_entered(body):
	self.queue_free()

func _ready():
	#self.Timer.set_wait_time(rand_range(0.0, 2.0))
	var time := rand_range(0.0, 1.0)
	yield(get_tree().create_timer(time), "timeout")
	self.visible = true
