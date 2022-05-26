// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_delete(){
	if(hoverNode != noone){
		if(hoverNode.occupant != noone){
			if(select_pressed()){
				
				instance_destroy(hoverNode.occupant);
				hoverNode.occupant = noone;
				hoverNode.componentCode = noone;
			
			}
			
		}else{
			if(hoverNode.terrain != noone){
				if(select_pressed()){
					hoverNode.terrainCode = noone; 
					
					instance_destroy(hoverNode.terrain);
					hoverNode.terrain = noone;
					
				}				
			}			
		}		
	}
}