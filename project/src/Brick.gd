extends StaticBody2D

onready var GameUI = $"/root/Background/GameUI"


func _ready() -> void:
	var _time := rand_range(0.0, 1.0)
	yield(get_tree().create_timer(_time), "timeout")
	self.visible = true


func hit() -> void:
	GameUI.score += ($"/root/Background".level + 1)
	queue_free()
