extends Node2D
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
	if event.is_action_pressed("ui_cancel"):
		get_tree().set_input_as_handled()
		$Popup.popup()
		get_tree().paused = true


func close_dialog(dialog,response):
	dialog.queue_free()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().paused = false
	set_process_input(true) 
	if(response.message=="Continue"):
		pass 


func _on_btn_quit_pressed():
	get_tree().paused = false
	var b := get_tree().change_scene("res://src/TitleScreen.tscn")
	if b :
		pass


func _on_btn_continue_pressed():
	get_tree().paused = false
	$Popup.hide()
