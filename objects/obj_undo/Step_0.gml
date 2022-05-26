if(global.totalMoves > 0){
	clickable = true;	
	
}else{
	clickable = false;
	
}




if(clickable){
	if(instance_position(mouse_x, mouse_y, id)){
			image_index = 1;
		
			if(select_pressed()){
				
				audio_play_sound(s_cancel, 1, false);
				
				with(obj_component){

				    //if they have a struct within their undo list
				    if(!ds_priority_empty(undoList)){
				        //find the head of the list (sorted by priority)
				        var head = ds_priority_find_max(undoList);

				        //and if the priority of the matches the global.totalMoves
				        //(it was the last movement or action)
				        if(ds_priority_find_priority(undoList, head) == global.totalMoves){
				            //revert that component to its last saved struct
				            set_component_info(head, id, true);
				            ds_priority_delete_max(undoList);
							
							var kk = 0
				        }
				    }
				}
				
				with(obj_terrain){

				    //if they have a struct within their undo list
				    if(!ds_priority_empty(undoList)){
				        //find the head of the list (sorted by priority)
				        var head = ds_priority_find_max(undoList);

				        //and if the priority of the matches the global.totalMoves
				        //(it was the last movement or action)
				        if(ds_priority_find_priority(undoList, head) == global.totalMoves){
				            //revert that component to its last saved struct
				            set_terrain_info(head, id, true);
				            ds_priority_delete_max(undoList);
							
							var kk = 0
				        }
				    }
				}
				
				global.totalMoves--
				global.undoneMoves++;
				
				wipe_nodes();
				obj_interface.selectedActor = noone;
				obj_interface.state = "idle";
			}
		
		}else{
			image_index = 0;
		}
}else{
	image_index = 2; 
	
}