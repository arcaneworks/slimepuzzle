//this script is meant to run when an actor steps into an enemy's reaction list 
//
function enemy_reaction_move(){
	wipe_nodes();
	if(canMove && componentStruct.feats.chases){
		var distance = 15;
		var target = noone;
		with(obj_agent){
			var xdif = abs(gridX - other.gridX);
			var ydif = abs(gridY - other.gridY);
			var tempDist = xdif + ydif;
			if (tempDist < distance){
				distance = tempDist;
				target = id;		
			}	
		}
		if(target != noone && distance > 1){
			move_nodes(currNode);
			var xDiff = target.gridX - gridX;
			var yDiff = target.gridY - gridY;
			
			if (xDiff > 0 )
				facingDir = dir.east;
			else if (xDiff < 0)
				facingDir = dir.west;
				
				
			if(yDiff < 0)
				facingDir = dir.south;
			else 
				facingDir = dir.north;
					
			if(abs(xDiff) == 1 && abs(yDiff) == 1){
				yDiff = 0;
				
			}
			
			xDiff = clamp(xDiff,-1,1);
			yDiff = clamp(yDiff,-1,1);
				
			

			var xCoord = clamp(gridX + xDiff, 0 , map_width - 1);			
			var yCoord = clamp(gridY + yDiff, 0 , map_height - 1);
			var tempStruct = componentStruct;
			copy_component_to_struct(id,tempStruct);
			ds_priority_add(undoList, tempStruct, global.totalMoves);
			moveToNode = map[xCoord, yCoord];
			moveState = "start path";
			canMove = false;
			wipe_nodes();
		
		}
	}
	if(canAct){
		if(!ds_list_empty(reactList)){
				//if this node I just moved in is in the react List (returns -1
				
			var listIndex = -1;
			if(id != other.id)
				listIndex= ds_list_find_index(reactList, map[other.gridX, other.gridY]);	
			else
				listIndex = 0;
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
					if(other.id != id){
						if(other.triggersReaction)
							ds_list_add(targetList, other.id); 
						}
					else{
						if(ds_list_size(reactList) >0)
						{
							var tempTarget = ds_list_find_value(reactList, 0);
							if(tempTarget.occupant)
								ds_list_add(targetList, tempTarget );	
						}
						
						
					}
				}	
				var target = noone;
				if(other.id != id)
					target = other;
				else{
					if(ds_list_size(targetList) > 0)
						target = ds_list_find_value(targetList,0);
				}
				if(target == noone)
					return;
				//changes direction to face actor that stepped in reactnodes
				if(target.gridX > gridX){
					facingDir = dir.east;	
				}else{
					if(target.gridX < gridX){
						facingDir = dir.west;	
					}
				}
			
				if(target.gridY > gridY){
					facingDir = dir.north;	
				}else{
					if(target.gridY < gridY){
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
}
