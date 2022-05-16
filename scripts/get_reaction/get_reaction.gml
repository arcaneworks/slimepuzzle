// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_reaction(){
	
	with(obj_enemy){
		fill_reaction_list(reactList, action.targeting.reactionType, action.targeting.range);
		
		//if this enemy has react Nodes in the react list
		if(!ds_list_empty(reactList)){
			//if this node I just moved in is in the react List (returns -1
			var listIndex = ds_list_find_index(reactList, map[other.gridX, other.gridY]);
			
			if(listIndex > -1){ 
				//if this action targets all reactNodes
				if(action.targeting.targetAll){
					for(var ii = 0; ii < ds_list_size(reactList); ii++){
						var tempTarget = ds_list_find_value(reactList, ii); 
						ds_list_add(targetList, tempTarget); 
					}
				}else{
					//if this action single targets
					ds_list_add(targetList, other.id); 
				}
				
				ds_queue_enqueue(global.actionQueue, id); 
				actState = "action standby";
			}
		}
	}
	
	
	//switch(class){
		
	//	case "bomb":
		
	//		find_bomb_react_nodes();
		
	//	break; 
		
	//	case "fighter":
		
	//		find_fighter_reaction_nodes(); 
			
	//		if(ds_list_size(reactList) > 0){
	//			var tNode = ds_list_find_value(reactList, 0);
	//			if(tNode.occupant != noone){
	//				ds_queue_enqueue(global.actionQueue, id); 
	//				ds_list_add(targetList, tNode.occupant);	
					
	//				if(tNode.occupant.vehicle){
	//					tNode.occupant.vfxNode = tNode;	
	//				}
	//				actState = "action standby"; 
	//				reaction = true;
					
	//			}
				
	//		}
		
	//	break; 
			
	//}
}