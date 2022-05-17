// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_object_rotate(){
	if(selectedObjTool != noone){
		if(selectedObjTool.component && selectedObjTool.faces){
				if(keyboard_check_pressed(vk_right)){
					var tempPos = selectedObjTool.facingDir + 1;
					selectedObjTool.facingDir = tempPos mod 4;	
				}
			
		}
		
		
	}
}