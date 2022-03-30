// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_tab_select(){
	if(instance_position(x, y, obj_tab)){
		hoverTab = instance_position(x, y, obj_tab);				
		if(hoverTab != noone && hoverTab != obj_sub_toolbar_write.selectedTab){
			if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
				selectedObjTool = noone;
				obj_sub_toolbar_write.selectedObjTool = noone;
				obj_sub_toolbar_write.selectedTab = hoverTab;	
				obj_sub_toolbar_write.currPage = 1;
				
			}			
		}
	}else{
		hoverTab = noone;	
	}
}