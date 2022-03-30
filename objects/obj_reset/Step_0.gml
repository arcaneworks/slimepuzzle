if(instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)){
		image_index = 1;
		
		if(mouse_check_button_released(mb_left)){
			global.resets++;
			room_restart();
			
		}
	
	}else{
		image_index = 0;
	}