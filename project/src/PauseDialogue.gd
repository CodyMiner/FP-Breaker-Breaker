extends Popup

var my_scene = load("res://src/Background.tscn").instance()



func _draw():
	var r = Rect2($CenterContainer.rect_position,$CenterContainer.rect_size)
	draw_rect(r,Color(1,1,1,.5))


func _input(event):
	print (my_scene.get_class())
	if event.is_action("ui_cancel")  : 
		get_tree().set_input_as_handled()
		_on_btn_continue_pressed()


func _on_btn_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to(my_scene)
	
func _on_btn_continue_pressed():
	var response = {"message":"Continue"}
	if my_scene.has_method("close_dialog"):
		my_scene.close_dialog(self,response)
