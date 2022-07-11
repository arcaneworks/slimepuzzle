// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_object_rotate(rotator){
	
	if(rotator != noone){
		
		if(rotator.faces){
				if(keyboard_check_pressed(vk_right)){
					
					var tempPos = rotator.facingDir + 1;
					rotator.facingDir = tempPos mod 4;	
				}
				
				if(keyboard_check_pressed(vk_left)){
					
					var tempPos = rotator.facingDir - 1;
					
					if(tempPos < 0){
						tempPos = 3;	
					}
					rotator.facingDir = tempPos mod 4;	
				}
			
		}
		
		
	}
}