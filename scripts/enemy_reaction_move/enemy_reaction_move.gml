//this script is meant to run when an actor steps into an enemy's reaction list 
//
function enemy_reaction_move(){
	wipe_nodes();
	if(canAct)
	if(!ds_list_empty(reactList)){
			//if this node I just moved in is in the react List (returns -1
		var listIndex = ds_list_find_index(reactList, map[other.gridX, other.gridY]);		
		if(listIndex > -1){ 
			//if this action targets all reactNodes
			var tempStruct = snap_deep_copy(id.componentStruct);
			copy_component_to_struct(id, tempStruct);
			ds_priority_add(undoList, tempStruct, global.totalMoves);
			
			if(action.targeting.targetAll){
				for(var ii = 0; ii < ds_list_size(reactList); ii++){
					var tempTarget = ds_list_find_value(reactList, ii); 
					if(tempTarget.occupant){
						tempTarget = tempTarget;	
					if(tempTarget.occupant.triggersReaction)
					ds_list_add(targetList, tempTarget); 
					}
				}
			}else{
				//if this action single targets
				
				if(other.triggersReaction)
				ds_list_add(targetList, other.id); 
			}	
			
			//changes direction to face actor that stepped in reactnodes
			if(other.gridX > gridX){
				facingDir = dir.east;	
			}else{
				if(other.gridX < gridX){
					facingDir = dir.west;	
				}
			}
			
			if(other.gridY > gridY){
				facingDir = dir.north;	
			}else{
				if(other.gridY < gridY){
					facingDir = dir.south;	
				}
			}
			
			ds_priority_add(global.actionQueue, id, SPD); 
			canAct = false;
			actState = "action standby";
			global.cursorState = "idle";
		}
	}
}
