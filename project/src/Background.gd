extends Node2D

func _setup_bricks():
	for row in range(6):
		for column in range(6):
			var bricky = load("res://src/Brick.tscn")
			var brick = bricky.instance()
			brick.position = Vector2(column*65+40, row*30+22.5)
			brick.get_node("Sprite").frame = row
			add_child_below_node($BrickContainer, brick)

func _ready():
	_setup_bricks()
