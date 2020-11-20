extends StaticBody2D

export (int) var points = 5
onready var GameUI = $"/root/Background/GameUI"

func _ready() -> void:
	var _time := rand_range(0.0, 1.0)
	yield(get_tree().create_timer(_time), "timeout")
	self.visible = true


func hit():
	GameUI.score += points
	queue_free()
