if(pause_pressed()){
	if(obj_interface_editor.state != "load")
		TransitionStart(rm_title_screen, sqFadeOut, sqFadeInMenu);	
	else
		obj_interface_editor.state = "move";
}

