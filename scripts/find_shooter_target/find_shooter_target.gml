// finds target to shoot when it's shooter's turn. based on facingDir (facing direction)
// 
function find_shooter_target(){
	
	var range = action.targeting.range;
	target = noone;
	
	var lBound = 0; //boundry on left side of map
	var rBound = map_width; //right side
	var bBound = 0; //bottom side
	var tBound = map_height; //top side
			
		//NORTH
		for(var yy = gridY + 1; yy < gridY + range; yy++){ //searches tempTargets for occupants
			if(yy <= tBound){ //if y pos is in boundry of map
						
				var tempTarget = map[gridX, yy]; 
						
				if(instance_exists(tempTarget)){
							
					tempTarget.actionNode = true;
					ds_list_add(dirList, tempTarget);

					break;
				}
			}
		}
					
			//EAST		
			for(var xx = gridX + 1; xx < gridX + range; xx++){
				if(xx <= rBound){
					var tempTarget = map[xx, gridY];
					
					if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.disabled){
						tempTarget.actionNode = true;
						ds_list_add(dirList, tempTarget);
						break;
					}
				}
							
			}
			 
			//SOUTH 
				for(var yy = gridY - 1; yy > gridY - range; yy--){ // start from closest node in range
					if(yy >= bBound){// if that node is on map
						
						var tempTarget = map[gridX, yy]; 
							
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.disabled){// and that node has an occupant
							tempTarget.actionNode = true;
							ds_list_add(dirList, tempTarget);
							break;// get out of for loop
						}
					}

				}	
				
			//WEST	
			for(var xx = gridX - range; xx < gridX; xx++){
				if(xx >= 0){
					var tempTarget = map[xx, gridY]; 
						
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.disabled){
							tempTarget.actionNode = true;
							ds_list_add(dirList, tempTarget);
							
							break;
						}
					}		
				}

				
	
}