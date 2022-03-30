// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_tool_select(){

	if(hoverTool != noone){
		if( mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
			
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
			}
		}
	}
}