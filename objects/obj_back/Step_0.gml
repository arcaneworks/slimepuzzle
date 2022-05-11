
if(instance_position(mouse_x, mouse_y, id)){
		image_index = 1;
		
		if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
				global.cursor = noone;
				global.editorTarget = global.testTarget;
				room_goto(level_editor_room);
		}
	
	}else{
		image_index = 0;
	}
