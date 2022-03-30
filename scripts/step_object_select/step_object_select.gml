// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_object_select(){
	if(instance_position(x, y, obj_bare_object_tool)){
		if(instance_position(x, y, obj_bare_object_tool).hoverable){
		 hoverObjTool = instance_position(x, y, obj_bare_object_tool);				
			if(hoverObjTool != noone && hoverObjTool.hoverable && hoverObjTool.tool){
				if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
					selectedObjTool =  hoverObjTool;
					obj_sub_toolbar_write.selectedObjTool = hoverObjTool;			
				}			
			}
		}
	}else{
		hoverObjTool = noone;	
	}
}
