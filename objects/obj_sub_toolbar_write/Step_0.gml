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
		if(currPage >= totalPages){
			currPage = 0;
		}
	}
	if(left_shoulder_pressed()){
		if(currPage<= 0)
			currPage = totalPages -1;	
		else
			currPage --;
	}
	for(var ii = 0; ii< tabSize; ii ++){
		if(keyboard_check_pressed(ord(ii+1))){
			var currList;
			var subIndex = ii + (currPage * tabSize);
			switch(selectedTab.tabType){
				case "actors":
					currList = actorList;
					//with(obj_bare_component_tool){
						
					//}
				break;
				case "elements":
					currList = elementList;
					//with(obj_bare_element_tool){
						
					//}
				break;
				case "terrains":
					currList = terrainList;
					//with(obj_bare_terrain_tool){
						
					//}
				break;
			}
			
			if(subIndex < ds_list_size(currList))
				step_object_select(true, ds_list_find_value(currList, subIndex));
			
		}
	}
#endregion

if(obj_sub_toolbar_write.visible){
	pageText = string(currPage + 1) + " / " + string(totalPages);
	var pageMin = currPage * tabSize;
	var pageMax = (currPage + 1) * tabSize;
	switch(selectedTab.tabType){
	
		case "actors":
			totalPages = totalActorPages;
			
			instance_deactivate_object(obj_bare_element_tool);
			instance_deactivate_object(obj_bare_terrain_tool);
			
			for(var ii = 0; ii <ds_list_size(actorList); ii++){
				var actor = ds_list_find_value(actorList, ii);
				if(ii < pageMin || ii >= pageMax){
					instance_deactivate_object(actor);
				}else{
					instance_activate_object(actor);
				}
				
			}
			
	
		break;
	
	
		case "elements":
			totalPages = totalElementPages;
			instance_deactivate_object(obj_bare_component_tool);
			instance_deactivate_object(obj_bare_terrain_tool);
			
			for(var ii = 0; ii <ds_list_size(elementList); ii++){
				var element = ds_list_find_value(elementList, ii);
				if(ii < pageMin || ii >= pageMax){
					instance_deactivate_object(element);
				}else{
					instance_activate_object(element);
				}
				
			}
			
 			
	
	
		break;
	
		case "terrains":
			totalPages = totalTerrainPages;
			instance_deactivate_object(obj_bare_component_tool);
			instance_deactivate_object(obj_bare_element_tool);
			instance_activate_object(obj_bare_terrain_tool);
			
			for(var ii = 0; ii <ds_list_size(terrainList); ii++){
				var terrain = ds_list_find_value(terrainList, ii);
				if(ii < pageMin || ii >= pageMax){
					instance_deactivate_object(terrain);
				}else{
					instance_activate_object(terrain);
				}
				
			}
			
	
		break;
	}
}
