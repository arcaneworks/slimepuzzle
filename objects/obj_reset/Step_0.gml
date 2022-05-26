if(instance_position(mouse_x, mouse_y, id)){
		image_index = 1;
		
		if(select_pressed()){
			global.resets++;
			room_restart();
			
		}
	
	}else{
		image_index = 0;
	}