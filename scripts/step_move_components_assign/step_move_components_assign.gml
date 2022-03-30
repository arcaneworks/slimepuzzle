// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_move_components_assign(){
	
	
	
	if(hoverNode != noone){ // if a hover node exists 
		if(hoverNode.occupant != noone){ //and it has an occupant
			if(selectedObj == noone){  //if there isn't a selected Comp
				if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
					selectedObj = hoverNode.occupant; // make that component the selectedComp		
					prevNode = hoverNode;
					prevNode.occupant = noone;
					prevNode.componentCode = noone;
					state = "move2";
				}
			}
		}else{// IF THE NODE DOES NOT HAVE AN OCCUPANT
			if(hoverNode.terrain != noone){
				if(selectedObj == noone){
					if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
						if(hoverNode.terrain != noone){
							selectedObj = hoverNode.terrain;
							prevNode = hoverNode; 
							prevNode.terrain = noone;
							prevNode.terrainCode = noone;
							state = "move2";
						}	
					}
				}
			
			}
		}
			
	}
}