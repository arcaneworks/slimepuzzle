// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_reaction_move(){
	ds_list_clear(reactList);
	var originNode =  map[gridX,gridY];
	wipe_nodes();
	
	action_nodes(originNode, action.targeting.targetType, action.targeting.range);
	
	
	with(obj_node){
		if(actionNode || passNode){
			ds_list_add(other.reactList, id);
		}
	}
	
	if(!ds_list_empty(reactList)){
		
			//if this node I just moved in is in the react List (returns -1
		var listIndex = ds_list_find_index(reactList, map[other.gridX, other.gridY]);
			
		if(listIndex > -1){ 
			//if this action targets all reactNodes
			if(action.targeting.targetAll){
				for(var ii = 0; ii < ds_list_size(reactList); ii++){
					var tempTarget = ds_list_find_value(reactList, ii); 
					if(tempTarget.occupant){
						tempTarget = tempTarget.occupant;	
					}
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
