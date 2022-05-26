
if(instance_position(mouse_x, mouse_y, id)){
		image_index = 1;
		
		if(select_pressed()){
			
				global.editorTarget = global.testTarget;
				global.lastRoom = room;
				TransitionStart(level_editor_room,sqSlideOutDiagonal, sqSlideInDiagonal);
		}
	
	}else{
		image_index = 0;
	}
