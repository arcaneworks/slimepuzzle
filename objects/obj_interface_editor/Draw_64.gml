
if(obj_level_editor.debugMode){
	var debugList = ds_list_create();
	
	if(hoverNode != noone){
		if(hoverNode.occupant != noone){
			ds_list_add(debugList, "OCCUPANT EXISTS");
			
		}else{
			ds_list_add(debugList, "OCCUPANT = NOONE");
			
		}
		if(hoverNode.componentCode != noone){
			ds_list_add(debugList, "COMPONENT CODE = " + hoverNode.componentCode);
			
		}else{
		  ds_list_add(debugList, "COMPONENT CODE = NOONE");
		}
		
		if(hoverNode.terrain != noone){
			ds_list_add(debugList, "TERRAIN EXISTS");
			
		}else{
			ds_list_add(debugList, "TERRAIN = NOONE");
			
		}
		
		if(hoverNode.terrainCode != noone){
			ds_list_add(debugList, "TERRAIN CODE = " + hoverNode.terrainCode);
			
		}else{
		  ds_list_add(debugList, "TERRAIN CODE = NOONE");
		}
		
		
		
	}
	
	if(ds_list_size(debugList) > 0){
	ds_list_draw(debugList,device_mouse_x_to_gui(0) + sprite_width, device_mouse_y_to_gui(0) + 50, 0, 20, false);
	}
	ds_list_destroy(debugList);
}

