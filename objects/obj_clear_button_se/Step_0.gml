


if(instance_position(mouse_x, mouse_y, id)){
	image_index = 1;
		
	if(select_pressed()){
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