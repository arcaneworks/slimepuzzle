if(ds_stack_empty(moveStack)){
	clickable = false;	
	
}else{
	clickable = true;
	headActor = ds_stack_top(moveStack)
	
	if(instance_exists(headActor)){
		 if(!headActor.canMove && !headActor.canAct){
			ds_stack_pop(moveStack);
		 }
	}else{
		ds_stack_pop(moveStack)		
	}
}




if(clickable){
	if(instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)){
			image_index = 1;
		
			if(mouse_check_button_released(mb_left)){
				audio_play_sound(s_cancel, 1, false);
				global.undoneMoves++;
				wipe_nodes();
				headActor = ds_stack_top(moveStack);
				headActor.canMove = true; 
				map[headActor.gridX, headActor.gridY].occupant = noone;
				headActor.gridX = headActor.prevNode.gridX;
				headActor.gridY = headActor.prevNode.gridY;
				headActor.x = headActor.prevNode.x;
				headActor.y = headActor.prevNode.y;
				headActor.prevNode.occupant = headActor;
				headActor.prevNode = noone;	
				ds_list_clear_inner_lists(global.cursor.dirNodes);
				ds_list_clear_inner_lists(global.cursor.moveNodes)
				global.cursor.selectedActor = headActor;
				move_nodes(map[headActor.gridX, headActor.gridY]);
				global.cursor.state = "move";
				
				if(map[headActor.gridX, headActor.gridY].terrain == "HOLE"){
					headActor.incapacitated = true;
					
				}else{
					headActor.incapacitated = false;	
				}
				
				ds_stack_pop(moveStack);
				
			}
	
		}else{
			image_index = 0;
		}
}else{
	image_index = 2; 
	
}