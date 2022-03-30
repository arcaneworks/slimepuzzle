// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_move_relocate(){
	if(hoverNode != noone){
		if(selectedObj != noone){
			if( mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
				if(selectedObj.component){
					if(hoverNode.occupant == noone){
						hoverNode.occupant = selectedObj;					
						selectedObj.x = hoverNode.x;
						selectedObj.y = hoverNode.y;
						hoverNode.componentCode = selectedObj.componentCode;
						selectedObj = noone;	
						state = "move";
						
					}
				}else{ //if selectedObj is terrain
					if(selectedObj.terrain){
						if(hoverNode.terrain == noone){
							hoverNode.terrain = selectedObj;					
							selectedObj.x = hoverNode.x;
							selectedObj.y = hoverNode.y;
							hoverNode.terrainCode = selectedObj.terrainCode;
							selectedObj = noone;	
							state = "move";
							
						}
					}	
				}
			}
		}
	}
}