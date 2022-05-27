// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_object_select(check = false, objTool = noone){
	if(check || instance_position(x, y, obj_bare_object_tool)){
		if(check || instance_position(x, y, obj_bare_object_tool).hoverable){
			if(objTool == noone)
				hoverObjTool = instance_position(x, y, obj_bare_object_tool);
			else
				hoverObjTool = objTool;
			if(hoverObjTool != noone && (check || hoverObjTool.hoverable)){
				if(check || select_pressed()){
					obj_interface_editor.selectedObjTool =  hoverObjTool;
					obj_sub_toolbar_write.selectedObjTool = hoverObjTool;			
				}			
			}
		}
	}else{
		hoverObjTool = noone;	
	}
}
