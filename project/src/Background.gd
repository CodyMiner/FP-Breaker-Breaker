extends Node2D

onready var pause_dialog_desource = preload("res://src/pause_dialog.tscn")


func _setup_bricks():
	randomize()
	for row in range(6):
		for column in range(6):
			var bricky = load("res://src/Brick.tscn")
			var brick = bricky.instance()
			brick.position = Vector2(column*65+40, row*30+22.5)
			brick.get_node("Sprite").frame = row
			add_child_below_node($BrickContainer, brick)


func _ready():
	_setup_bricks()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_process_input(true)


func _input(event):
	if event.is_action("ui_cancel") and not event.is_pressed():
		get_tree().set_input_as_handled()
		set_process_input(false)
		show_pause_dialog()


func show_pause_dialog():
	var pause_dialog_node = pause_dialog_desource.instance()
	self.add_child(pause_dialog_node)
	pause_dialog_node.delegate = self 
	pause_dialog_node.popup()
	get_tree().set_pause(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func close_dialog(dialog,response):
	dialog.queue_free()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().set_pause(false)
	set_process_input(true) 
	if(response.message=="Continue"):
		pass 
