///target_nodes(oNode, targetType, range)
///@param oNode
///@param targetType
///@param range

function action_nodes(originNode, targetType, range) {
	var oNode = originNode;
	var oX = oNode.gridX;
	var oY = oNode.gridY;
	var dirNum = 4; //number of directions the target
	var lBound = 0; //boundry on left side of map
	var rBound = map_width; //right side
	var bBound = 0; //bottom side
	var tBound = map_height; //top side
	var dirNodes = global.cursor.dirNodes;
	var foundTarget = false;
	ds_list_clear_inner_lists(dirNodes);

	switch(targetType){
	
		case "self":
			oNode.actionNode = true;
		break;
	
	
		case "line":
		
			for(var xx = oX - range; xx <= oX + range; xx++){
				if(xx >= lBound && xx < rBound){
					map[xx, oY].actionNode = true;
				}
			}
		
		
			for(var yy = oY - range; yy <= oY + range; yy++){	
				if(yy >= bBound && yy <= tBound){
					map[oX, yy].actionNode = true;			
				}
			}
		
			oNode.actionNode = false;
			
			break;
		
		case "melee":

			for(var xx = oX - 1; xx <= oX + 1; xx++){
				if(xx >= lBound && xx < rBound){
					if(xx < oX){
						var dirList = ds_list_find_value(dirNodes, dir.west);
						ds_list_add(dirList, map[xx, oY]);
					}
					
					if(xx > oX){
						var dirList = ds_list_find_value(dirNodes, dir.east);
						ds_list_add(dirList, map[xx, oY]);
					}
					
					map[xx, oY].actionNode = true;
				}
			}
	
			for(var yy = oY - 1; yy <= oY + 1; yy++){
				if(yy >= bBound && yy < tBound){	
					if(yy < oY){
						var dirList = ds_list_find_value(dirNodes, dir.south);
						ds_list_add(dirList, map[oX, yy]);
					}
					
					if(yy > oY){
						var dirList = ds_list_find_value(dirNodes, dir.north);
						ds_list_add(dirList, map[oX, yy]);
					}
					
					map[oX, yy].actionNode = true;		
				}
			}
		
			oNode.actionNode = false;
		
		break;
	
	
		case "adjacent":
			for(var xx = oX - range; xx <= oX + range; xx++){
				for(var yy = oY - range; yy <= oY + range; yy++){	
					if(in_bounds(xx,yy)){
						map[xx, yy].actionNode = true;
					}
				}
			}
		
			oNode.actionNode = false;
	
		break;
		
		case "shoot":
			//NORTH
			var dirList = ds_list_find_value(dirNodes, dir.north);
		
		
		break;
	
		case "bow":
			
			//NORTH
			for(var yy = oY + 1; yy < oY + range; yy++){ //searches tempTargets for occupants
				if(yy <= tBound){ //if y pos is in boundry of map
						
					var tempTarget = map[oX,yy];
				
					if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){
						var dirList = ds_list_find_value(dirNodes, dir.north);
						tempTarget.actionNode = true;
						ds_list_add(dirList, tempTarget);
						break;
					}else{
					
						if(yy == oY + range - 1 || yy == tBound){
							tempTarget.actionNode = true;		
						}else{
							tempTarget.passNode = true;	
						}
					
					}
				}
			}
					
			//EAST		
			for(var xx = oX + 1; xx < oX + range; xx++){
				if(xx <= rBound){
					var tempTarget = map[xx, oY];
					
					if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){
						var dirList = ds_list_find_value(dirNodes, dir.east);
						tempTarget.actionNode = true;
						ds_list_add(dirList, tempTarget);
						break;
					}else{
						
						if(xx == oX + range - 1 || xx == rBound){
							tempTarget.actionNode = true;
							
						}else{
							tempTarget.passNode = true;		
						}
					}
				}				
			}
			 
			//SOUTH 
			for(var yy = oY - 1; yy > oY - range; yy--){ // start from closest node in range
				if(yy >= bBound){// if that node is on map
						
					var tempTarget = map[oX, yy]; 
							
					if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){// and that node has an occupant
						var dirList = ds_list_find_value(dirNodes, dir.south);
						tempTarget.actionNode = true;
						ds_list_add(dirList, tempTarget);
						break;
						// get out of for loop
					}else{
							
						if(yy == oY - range + 1 || yy == bBound){
							tempTarget.actionNode = true;		
						}else{
							tempTarget.passNode = true;	
						}
						
					}
				}

			}	
				
			//WEST	
			for(var xx = oX - 1; xx > oX - range; xx--){
				if(xx >= 0){
					var tempTarget = map[xx, oY]; 
						
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){
							var dirList = ds_list_find_value(dirNodes, dir.west);
							tempTarget.actionNode = true;
							ds_list_add(dirList, tempTarget);
							break;
						}else{
							if(xx == oX - range + 1 || xx == lBound){
								tempTarget.actionNode = true;
								var dirList = ds_list_find_value(dirNodes, dir.west);
								ds_list_add(dirList, tempTarget);
							
							}else{
								tempTarget.passNode = true;		
							}
								
						}
					}		
				}
		break;
		
		case "diagonal":
	
			for(var dist = 1; dist <= range; dist++){

				if(in_bounds(oX + dist, oY + dist)){
					var dirList = ds_list_find_value(dirNodes, dir.north);
					var NEnode = map[oX + dist, oY + dist];
					ds_list_add(dirList, NEnode);
					NEnode.actionNode = true;
				}
				
				if(in_bounds(oX + dist, oY - dist)){
					var dirList = ds_list_find_value(dirNodes, dir.east);
					var SEnode = map[oX + dist, oY - dist];
					ds_list_add(dirList, SEnode);
					SEnode.actionNode = true;
				}
				
				if(in_bounds(oX - dist, oY - dist)){
					var dirList = ds_list_find_value(dirNodes, dir.south);
					var SWnode = map[oX - dist, oY - dist];
					ds_list_add(dirList, SWnode);
					SWnode.actionNode = true;
				}
				
				if(in_bounds(oX - dist, oY + dist)){
					var dirList = ds_list_find_value(dirNodes, dir.west);
					var NWnode = map[oX - dist, oY + dist];	
					ds_list_add(dirList, NWnode);
					NWnode.actionNode = true;
				}
					
			}
			
		break;
	
		
	}
}
