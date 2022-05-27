// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_tab_select(){
	if(instance_position(x, y, obj_tab)){
		hoverTab = instance_position(x, y, obj_tab);				
		if(hoverTab != noone && hoverTab != obj_sub_toolbar_write.selectedTab){
			if(select_pressed()){
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