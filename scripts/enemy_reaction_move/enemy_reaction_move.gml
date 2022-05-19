//this script is meant to run when an actor steps into an enemy's reaction list 
//
function enemy_reaction_move(){
	
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
					if(tempTarget.triggersReaction)
					ds_list_add(targetList, tempTarget); 
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
			actState = "action standby";
		}
	}
}
