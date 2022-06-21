// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_object_select(check = false, objTool = noone){
	
	var inst = noone;
	switch(obj_sub_toolbar_write.selectedTab.tabType){
		case "actors":
			inst= instance_position(x, y, obj_bare_component_tool);
			break;
		case "elements":
			inst= instance_position(x, y, obj_bare_element_tool);
			break;
		case "terrains":
			inst= instance_position(x, y, obj_bare_terrain_tool);
			break;
	}
	
	if(check || inst ){
		if(check || inst.hoverable){
			if(objTool == noone)
				hoverObjTool = instance_position(x, y, obj_bare_object_tool);
			else
				hoverObjTool = objTool;
			if(hoverObjTool != noone && (check || hoverObjTool.hoverable)){
				if(check || select_pressed()){
					global.cursor.selectedObjTool =  hoverObjTool;
					obj_sub_toolbar_write.selectedObjTool = hoverObjTool;			
				}			
			}
		}
	}else{
		hoverObjTool = noone;	
	}
}
