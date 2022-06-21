if(pause_pressed()){
	if(global.cursor.state != "load")
		TransitionStart(rm_title_screen, sqFadeOut, sqFadeInMenu);	
	else
		global.cursor.state = "move";
}

