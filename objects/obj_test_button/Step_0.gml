if(instance_exists(obj_bare_component)){
	if(instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)){
		image_index = 1;
		
		if(mouse_check_button_released(mb_left)){
			save_CG_set("testroom");
			global.testTarget = "testroom";
			global.cursor = noone;
			room_goto(test_room);
		}
	
	}else{
		image_index = 0;
	}
}else{
	image_index = 2;	
	
}

