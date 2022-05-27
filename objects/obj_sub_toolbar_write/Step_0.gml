pageText = string(currPage) + " / " + string(totalPages);
pageTextWidth = string_width(pageText);
textStartX = x +  tabWidth +  .5 * widthMinusTab - .5 * pageTextWidth;
textStartY = y + 6; 
if(obj_interface_editor.state == "write"){
	visible = true; 	
}else{
	visible = false; 
}	

#region hotkey navigation
	if(switch_tab_hotkey_pressed()){
		tabIndex ++;
		if(tabIndex >= array_length(writeTabs))
			tabIndex = 0;
		selectedObjTool = noone;
		with(obj_tab){
			if(tabType == other.writeTabs[other.tabIndex])
				other.selectedTab = self;
			
		}
		currPage = 0;
	}
	if(right_shoulder_pressed()){
		currPage++;
		//var pageCount = 0;
		//switch(selectedTab.tabType){
		//	case "actors":
		//		pageCount = totalActorPages;
		//		break;
		//	case "elements":
		//		pageCount = totalElementPages;
		//		break;
		//	case "terrains":
		//		pageCount = totalTerrainPages;
		//		break;
		//}
		if(currPage >= totalPages){
			currPage = 0;
		}
	}
	if(left_shoulder_pressed()){
		if(currPage<0)
			currPage = totalPages -1;	
		else
			currPage --;
	}
#endregion

if(obj_sub_toolbar_write.visible){
	pageText = string(currPage + 1) + " / " + string(totalPages);
	switch(selectedTab.tabType){
	
		case "actors":
			totalPages = totalActorPages;
			
			instance_deactivate_object(obj_bare_element_tool);
			instance_deactivate_object(obj_bare_terrain_tool);
			
			switch(currPage){
				case 0:
					for(var ii = 0; ii < ds_list_size(actorList1); ii++){
						var actor = ds_list_find_value(actorList1, ii);	
						instance_activate_object(actor);		
					}
					
					for(var ii = 0; ii < ds_list_size(actorList3); ii++){
						var actor = ds_list_find_value(actorList3, ii);	
						instance_deactivate_object(actor);		
					}
					
					for(var ii = 0; ii < ds_list_size(actorList2); ii++){
						var actor = ds_list_find_value(actorList2, ii);		
						instance_deactivate_object(actor);		
					}
				
				break;
				
				
				case 1:
					for(var ii = 0; ii < ds_list_size(actorList1); ii++){
						var actor = ds_list_find_value(actorList1, ii);	
						instance_deactivate_object(actor);		
					}
					
					for(var ii = 0; ii < ds_list_size(actorList3); ii++){
						var actor = ds_list_find_value(actorList3, ii);	
						instance_deactivate_object(actor);		
					}
					
					for(var ii = 0; ii < ds_list_size(actorList2); ii++){
						var actor = ds_list_find_value(actorList2, ii)		
						instance_activate_object(actor);		
					}
				
				break;
				
				case 2:
					for(var ii = 0; ii < ds_list_size(actorList1); ii++){
						var actor = ds_list_find_value(actorList1, ii);	
						instance_deactivate_object(actor);		
					}
					
					for(var ii = 0; ii < ds_list_size(actorList2); ii++){
						var actor = ds_list_find_value(actorList2, ii);		
						instance_deactivate_object(actor);		
					}
					
					for(var ii = 0; ii < ds_list_size(actorList3); ii++){
						var actor = ds_list_find_value(actorList3, ii)		
						instance_activate_object(actor);		
					}
				
				break; 
				
				
			}
	
		break;
	
	
		case "elements":
			totalPages = totalElementPages;
			instance_deactivate_object(obj_bare_component_tool);
			instance_deactivate_object(obj_bare_terrain_tool);

			switch(currPage){
				case 0:
					for(var ii = 0; ii < ds_list_size(elementList1); ii++){
						var element = ds_list_find_value(elementList1, ii);	
						instance_activate_object(element);		
					}
					
					for(var ii = 0; ii < ds_list_size(elementList2); ii++){
						var element = ds_list_find_value(elementList2, ii);		
						
						instance_deactivate_object(element);		
					}
				
				break;
				
				
				case 1:
					for(var ii = 0; ii < ds_list_size(elementList1); ii++){
						var element = ds_list_find_value(elementList1, ii);	
						instance_deactivate_object(element);		
					}
					
					for(var ii = 0; ii < ds_list_size(elementList2); ii++){
						var element = ds_list_find_value(elementList2, ii)		
						instance_activate_object(element);		
					}
				
				break; 
				
				
			}
 			
	
	
		break;
	
		case "terrains":
			totalPages = totalTerrainPages;
			instance_deactivate_object(obj_bare_component_tool);
			instance_deactivate_object(obj_bare_element_tool);
			instance_activate_object(obj_bare_terrain_tool);

	
		break;
	}
}
