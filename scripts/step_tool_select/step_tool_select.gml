// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_tool_select(check = false){

	if(hoverTool != noone){
		if(check || select_pressed()){
			
			if(selectedTool == hoverTool){
				selectedTool = noone; 
				selectedObjTool = noone;
				state = "idle";
				obj_sub_toolbar_write.selectedObjTool = noone;
				
			}else{
				if(selectedObj != noone){
					if(selectedObj.component){
						prevNode.occupant = selectedObj;
						prevNode.componentCode = selectedObj.componentCode; 
						selectedObj = noone;
						prevNode = noone;	
					}else{
						prevNode.terrain = selectedObj;
						prevNode.terrainCode = selectedObj.terrainCode; 
						selectedObj = noone;
						prevNode = noone;	
					}
				}
				
				//if(state == "save"){
				//	var fArray = array_create(0); 
				//	fArray = get_level_file_list();
				//	var fileCount = array_length(fArray);
				//	save_CG_set(global.editorTarget)
				//}
					
				selectedTool = hoverTool;
				obj_sub_toolbar_write.selectedObjTool = noone;
				selectedObjTool = noone;
				state = selectedTool.toolType; 
				
				if(state == "save"){
					var confirmText = "are you sure you want to overwrite this file?";
					create_confirm_box(100, 100, confirmText, true, id);	
				}
			}
		}
	}
}