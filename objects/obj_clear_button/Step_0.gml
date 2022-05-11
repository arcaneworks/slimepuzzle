


if(instance_position(mouse_x, mouse_y, id)){
	image_index = 1;
		
	if(mouse_check_button_released(mb_left) || gamepad_button_check(0,gp_face1)){
		if(obj_interface_editor.selectedObj != noone){
			instance_destroy(obj_interface_editor.selectedObj);
			obj_interface_editor.selectedObj = noone;
		}
		
		with(obj_node){		
			if(terrain != noone){
				instance_destroy(terrain);	
				terrain = noone;
				terrainCode = noone;
			}
				
			if(occupant != noone){
				instance_destroy(occupant);		
				occupant = noone;
				componentCode = noone;	
			}		
		}
	}
	
}else{
	image_index = 0;
}