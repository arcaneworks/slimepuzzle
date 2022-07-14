// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_reaction(enemy){
	if(canAct)
	if(!ds_list_empty(reactList)){
			//if this node I just moved in is in the react List (returns -1	 
			//if this action targets all reactNodes
			if(action.targeting.targetAll){
				for(var ii = 0; ii < ds_list_size(reactList); ii++){
					var tempTarget = ds_list_find_value(reactList, ii); 
					if(tempTarget.occupant){
						tempTarget = tempTarget;	
					if(tempTarget.occupant && tempTarget.occupant.triggersReaction && tempTarget.occupant.targetable)
						ds_list_add(targetList, tempTarget); 
					}
				}
				
			}else{
				//if this action single targets 
				for(var ii = 0; ii < ds_list_size(reactList); ii++){
					var tempTarget = ds_list_find_value(reactList, ii); 
					if(tempTarget.occupant){
						tempTarget = tempTarget;	
					if(tempTarget.occupant.triggersReaction && tempTarget.occupant.targetable)
						ds_list_add(targetList, tempTarget); 
						break;
					}
				}
				
				if(ds_list_size(targetList) > 0){
					var tempTarget = ds_list_find_value(targetList, 0);
					
					if(tempTarget.gridX > gridX){
						facingDir = dir.east;	
					}else{
						if(tempTarget.gridX < gridX){
							facingDir = dir.west;	
						}
					}
			
					if(tempTarget.gridY > gridY){
						facingDir = dir.north;	
					}else{
						if(tempTarget.gridY < gridY){
							facingDir = dir.south;	
						}
					}
					
				}
			}	
			
			//changes direction to face actor that stepped in reactnodes
			
			
			ds_priority_add(global.actionQueue, id, SPD);
			
			canAct = false;
			actState = "action standby";
			global.cursorState = "idle";
	}
}

	

