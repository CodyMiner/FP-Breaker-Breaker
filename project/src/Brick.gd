extends StaticBody2D


func _ready() -> void:
	var _time := rand_range(0.0, 1.0)
	yield(get_tree().create_timer(_time), "timeout")
	self.visible = true


func hit() -> void:
	queue_free()
