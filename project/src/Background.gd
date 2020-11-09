extends Node2D

onready var _pause_dialog_desource: PackedScene = preload("res://src/pause_dialog.tscn")


func _setup_bricks() -> void:
	randomize()
	for _r in range(6):
		for _c in range(6):
			var _brick_model: PackedScene = load("res://src/Brick.tscn")
			var _brick: StaticBody2D = _brick_model.instance()
			_brick.position = Vector2(_c*65+40, _r*30+22.5)
			_brick.get_node("Sprite").frame = _r
			add_child_below_node($BrickContainer, _brick)


func _ready() -> void:
	_setup_bricks()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_process_input(true)


func _input(event) -> void:
	if event.is_action("ui_cancel") and not event.is_pressed():
		get_tree().set_input_as_handled()
		set_process_input(false)
		show_pause_dialog()


func show_pause_dialog() -> void:
	var _pause_dialog_node := _pause_dialog_desource.instance()
	self.add_child(_pause_dialog_node)
	_pause_dialog_node.delegate = self 
	_pause_dialog_node.popup()
	get_tree().set_pause(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func close_dialog(_dialog,_response) -> void:
	_dialog.queue_free()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().set_pause(false)
	set_process_input(true) 
	if(_response.message == "Continue"):
		pass 
