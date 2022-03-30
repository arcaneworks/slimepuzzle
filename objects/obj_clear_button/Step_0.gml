


if(instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)){
	image_index = 1;
		
	if(mouse_check_button_released(mb_left)){
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