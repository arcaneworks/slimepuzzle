//this script is meant to run when an actor steps into an enemy's reaction list 
//
function enemy_reaction_move(){
	wipe_nodes();
	if(disabled)
		return;
		
	if(!disabled && canMove && componentStruct.feats.chases 
	&& other.componentStruct.feats.triggersReaction && (currNode != noone ||
	currNode.terrain == noone || currNode.terrain.terrainString != "Ice")){
		var tempStruct = snap_deep_copy(id.componentStruct);
		copy_component_to_struct(id, tempStruct);
		show_debug_message(id.class + " performing reaction move at turn number " + string(global.totalMoves));
		ds_priority_add(undoList, tempStruct, global.totalMoves);
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
			else if(yDiff < 0)
				facingDir = dir.south;
			else
				facingDir = dir.north;
					
			//if(abs(xDiff) == 1 && abs(yDiff) == 1){
			//	yDiff = 0;
				
			//}
			if(abs(xDiff) == 1 && abs(yDiff) == 1){
				if(map[gridX + xDiff, gridY].occupant == noone)
					moveToNode = map[gridX + xDiff, gridY];
				else
					moveToNode = map[gridX, gridY + yDiff];
				
			}
			else{
				var pathList = path_to_node(currNode, move ,target.currNode)
			
			
				//var xCoord = clamp(gridX + xDiff, 0 , map_width - 1);			
				//var yCoord = clamp(gridY + yDiff, 0 , map_height - 1);
				var index = ds_list_size(pathList)-1;
				if ( ds_list_find_value(pathList, index).occupant != noone){
					index = index -1;	
				}
				moveToNode = ds_list_find_value(pathList, index);
				ds_list_destroy(pathList);
			}
			moveState = "start path";
			canMove = false;
			wipe_nodes();
		
		}
	}
	if(canAct ){
		if(!ds_list_empty(reactList)){
				//if this node I just moved in is in the react List (returns -1
				
			var listIndex = -1;
			if(id != other.id)
				listIndex= ds_list_find_index(reactList, map[other.gridX, other.gridY]);	
			else
				listIndex = 0;
			if(listIndex > -1){ 
				//if this action targets all reactNodes
				//var tempStruct = snap_deep_copy(id.componentStruct);
				//copy_component_to_struct(id, tempStruct);
				//ds_priority_add(undoList, tempStruct, global.totalMoves);
			
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
						if(other.componentStruct.feats.triggersReaction)
							ds_list_add(targetList, other.id); 
						}
					else{
						if(ds_list_size(reactList) >0)
						{
							var tempTarget = ds_list_find_value(reactList, 0);
							if(tempTarget.occupant && tempTarget.occupant.componentStruct.feats.triggersReaction)
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
				if(componentStruct.feats.chases)

					canMove = true;
			}
		}
	}
}
