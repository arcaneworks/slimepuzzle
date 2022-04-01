if(instance_exists(obj_bare_component)){
	if(instance_position(mouse_x, mouse_y, id)){
		image_index = 1;
		
		if(mouse_check_button_released(mb_left)){
			save_CG_set(obj_level_editor.level);
			global.testTarget = obj_level_editor.level;
			global.cursor = noone;
			room_goto(test_room);
		}
	
	}else{
		image_index = 0;
	}
}else{
	image_index = 2;	
	
}

