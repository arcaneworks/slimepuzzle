if(instance_position(mouse_x, mouse_y, id)){
		image_index = 1;
		
		if(mouse_check_button_released(mb_left)){
			global.resets++;
			room_restart();
			
		}
	
	}else{
		image_index = 0;
	}