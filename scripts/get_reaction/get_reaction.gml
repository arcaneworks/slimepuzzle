// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_reaction(){
	switch(class){
		
		case "bomb":
		
			find_bomb_react_nodes();
		
		break; 
		
		case "fighter":
		
			find_fighter_reaction_nodes(); 
			
			if(ds_list_size(reactList) > 0){
				var tNode = ds_list_find_value(reactList, 0);
				if(tNode.occupant != noone){
					ds_queue_enqueue(global.gameObj.actionQueue, id); 
					ds_list_add(targetList, tNode.occupant);	
					
					if(tNode.occupant.vehicle){
						tNode.occupant.vfxNode = tNode;	
					}
					actState = "action standby"; 
					reaction = true;
					
				}
				
			}
		
		break; 
			
	}
}