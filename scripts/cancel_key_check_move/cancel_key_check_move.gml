///@func deselect_key_check();
function cancel_key_check_move() {

	///@descrip FOR USE IN THE obj_interface STEP EVENT. If deselect key pressed, 
	///cursor idles and instance variables are cleared.
	
	if(selectedActor.canMove){
		if(cancel_pressed()){
			audio_play_sound(s_cancel, 0, false);
			wipe_nodes();
			ds_list_clear_inner_lists(dirNodes);
			ds_list_clear_inner_lists(moveNodes);
			movement_nodes(map[selectedActor.gridX, selectedActor.gridY], selectedActor.move);
			state = "clear";
			nextState = "move";
		}
	}else{
		
	}


}
