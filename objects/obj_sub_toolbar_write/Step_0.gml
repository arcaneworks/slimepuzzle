if(obj_interface_editor.state == "write"){
	visible = true; 	
}else{
	visible = false; 
}	


if(obj_sub_toolbar_write.visible){
	pageText = string(currPage) + " / " + string(totalPages);
	switch(selectedTab.tabType){
	
		case "actors":
			totalPages = totalActorPages;
			
			instance_deactivate_object(obj_bare_element_tool);
			instance_deactivate_object(obj_bare_terrain_tool);
			
			switch(currPage){
				case 1:
					for(var ii = 0; ii < ds_list_size(actorList1); ii++){
						var actor = ds_list_find_value(actorList1, ii);	
						instance_activate_object(actor);		
					}
					
					for(var ii = 0; ii < ds_list_size(actorList2); ii++){
						var actor = ds_list_find_value(actorList2, ii);		
						instance_deactivate_object(actor);		
					}
				
				break;
				
				
				case 2:
					for(var ii = 0; ii < ds_list_size(actorList1); ii++){
						var actor = ds_list_find_value(actorList1, ii);	
						instance_deactivate_object(actor);		
					}
					
					for(var ii = 0; ii < ds_list_size(actorList2); ii++){
						var actor = ds_list_find_value(actorList2, ii)		
						instance_activate_object(actor);		
					}
				
				break; 
				
				
			}
	
		break;
	
	
		case "elements":
			totalPages = totalElementPages;
 			instance_deactivate_object(obj_bare_component_tool);
			instance_deactivate_object(obj_bare_terrain_tool);
			instance_activate_object(obj_bare_element_tool);
	
	
		break;
	
		case "terrains":
			totalPages = totalTerrainPages;
			instance_deactivate_object(obj_bare_component_tool);
			instance_deactivate_object(obj_bare_element_tool);
			instance_activate_object(obj_bare_terrain_tool);

	
		break;
	}
}