extends Popup

onready var delegate  = self 

func _draw():
	var r = Rect2($CenterContainer.rect_position,$CenterContainer.rect_size)
	draw_rect(r,Color(1,1,1,.5))

			
func _input(event):
	if event.is_action("ui_cancel")  : 
		get_tree().set_input_as_handled()
		_on_btn_continue_pressed()
		
		
func _on_btn_quit_pressed():
	print("hii")
	get_tree().change_scene("res://src/TitleScreen.tscn")


	
func _on_btn_continue_pressed():
	var response = {"message":"Continue"}
	if delegate.has_method("close_dialog"):
		delegate.close_dialog(self,response)

