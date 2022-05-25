if(targetedBy != noone &&  redirect){
	
	if(targetedBy.class == "archer" || targetedBy.class == "director"){
	
	var range = action.targeting.range;
	var lBound = 0; //boundry on left side of map
	var rBound = map_width - 1; //right side
	var bBound = 0; //bottom side
	var tBound = map_height - 1; //top side
	
	switch(facingDir){
		
		case dir.south:
			//if shot from the left, aim down
			if(targetedBy.gridX < gridX){	
				for(var yy = gridY - 1; yy > gridY - range; yy--){ // start from closest node in range
					if(yy >= bBound){// if that node is on map
						
						var tempTarget = map[gridX, yy]; 
							
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
						}
					}
				}
				
				if(ds_list_empty(targetList)){
					for(var yy = gridY - range; yy < gridY - 1; yy++){ // start from closest node in range
						if(yy >= bBound){// if that node is on map
						
							var tempTarget = map[gridX, yy]; 
							
							if(instance_exists(tempTarget)){// and that node has an occupant
								ds_list_add(targetList, tempTarget);
								break;// get out of for loop
							}
						}
					}
				}
				
				var target = ds_list_find_value(targetList, 0); 
				
				if(target.occupant != noone){
					
					var occu = target.occupant
						occu.targetedBy = id;
				}
				global.cursor.state = "nothing";
				actState = "action standby";
				ds_priority_add(global.actionQueue, id, SPD);
				
			}
		
			//if shot from below, aim left
			if(targetedBy.gridY < gridY){
				for(var xx = gridX - 1; xx > gridX - range; xx--){
					if(xx >= 0){
						var tempTarget = map[xx, gridY]; 
						
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
						}
					}		
				}
				
				if(ds_list_empty(targetList)){
					for(var xx = gridX - range; xx < gridX; xx++){
						if(xx >= 0){
							var tempTarget = map[xx, gridY]; 
						
						if(instance_exists(tempTarget)){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
							}
						}		
					}
				}
				
			
				var target = ds_list_find_value(targetList, 0); 
				if(target.occupant != noone){
					var occu = target.occupant
						occu.targetedBy = id;
				}
				global.cursor.state = "nothing";
				actState = "action standby";
				ds_priority_add(global.actionQueue, id, SPD);
			
			}
			
		break;
		
		
		case dir.east:
		
			//if shot from the right, aim down 
			if(targetedBy.gridX > gridX){
				for(var yy = gridY - 1; yy > gridY - range; yy--){ // start from closest node in range
					if(yy >= bBound){// if that node is on map
						
						var tempTarget = map[gridX, yy]; 
							
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
						}
					}
				}
				
				if(ds_list_empty(targetList)){
					for(var yy = gridY - range; yy < gridY - 1; yy++){ // start from closest node in range
						if(yy >= bBound){// if that node is on map
						
							var tempTarget = map[gridX, yy]; 
							
							if(instance_exists(tempTarget)){// and that node has an occupant
								ds_list_add(targetList, tempTarget);
								break;// get out of for loop
							}
						}
					}
				}
				
				var target = ds_list_find_value(targetList, 0); 
				if(target.occupant != noone){
					var occu = target.occupant
						occu.targetedBy = id;
				}
				global.cursor.state = "nothing";
				actState = "action standby";
				ds_priority_add(global.actionQueue, id, SPD);
				
				
			}
			
			//if shot from below, aim right
			if(targetedBy.gridY < gridY){
				for(var xx = gridX + 1; xx < gridX + range; xx++){
					if(xx <= rBound){
						var tempTarget = map[xx, gridY]; 
						
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
						}
					}		
				}
				
				if(ds_list_empty(targetList)){
					for(var xx = gridX + range; xx > gridX; xx--){
						if(xx <= rBound){
							var tempTarget = map[xx, gridY]; 
						
						if(instance_exists(tempTarget)){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
							}
						}		
					}
				}
				
			
				var target = ds_list_find_value(targetList, 0); 
				if(target.occupant != noone){
					var occu = target.occupant
						occu.targetedBy = id;
				}
			
				global.cursor.state = "nothing";
				actState = "action standby";
				ds_priority_add(global.actionQueue, id, SPD);
			}
		
		
		break;
		
		
		case dir.west:
			//if shot from the left, aim up
			if(targetedBy.gridX < gridX){
				for(var yy = gridY + 1; yy < gridY + range; yy++){ // start from closest node in range
					if(yy <= tBound){// if that node is on map
						
						var tempTarget = map[gridX, yy]; 
							
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
						}
					}
				}
				
				if(ds_list_empty(targetList)){
					for(var yy = gridY + range; yy > gridY + 1; yy--){ // start from closest node in range
						if(yy <= tBound){// if that node is on map
						
							var tempTarget = map[gridX, yy]; 
							
							if(instance_exists(tempTarget)){// and that node has an occupant
								ds_list_add(targetList, tempTarget);
								break;// get out of for loop
							}
						}
					}
				}
				
				var target = ds_list_find_value(targetList, 0); 
				if(target.occupant != noone){
					var occu = target.occupant
						occu.targetedBy = id;
				}
				global.cursor.state = "nothing";
				actState = "action standby";
				ds_priority_add(global.actionQueue, id, SPD);
			}
			
			
			//if shot from above, aim left
			if(targetedBy.gridY > gridY){
				for(var xx = gridX - 1; xx > gridX - range; xx--){
					if(xx >= 0){
						var tempTarget = map[xx, gridY]; 
						
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
						}
					}		
				}
				
				if(ds_list_empty(targetList)){
					for(var xx = gridX - range; xx < gridX; xx++){
						if(xx >= 0){
							var tempTarget = map[xx, gridY]; 
						
						if(instance_exists(tempTarget)){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
							}
						}		
					}
				}
				
			
				var target = ds_list_find_value(targetList, 0); 
				if(target.occupant != noone){
					var occu = target.occupant
						occu.targetedBy = id;
				};
				global.cursor.state = "nothing";
				actState = "action standby";
				ds_priority_add(global.actionQueue, id, SPD);
			}
				
		break;
		
		
		case dir.north:
			//if shot from the right, aim up
			if(targetedBy.gridX > gridX){
				for(var yy = gridY + range; yy > gridY + 1; yy--){ // start from closest node in range
					if(yy <= tBound){// if that node is on map
						
						var tempTarget = map[gridX, yy]; 
							
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
						}
					}
				}
				
				if(ds_list_empty(targetList)){
					for(var xx = gridX + 1; xx < gridX + range; xx++){
						if(xx <= rBound){
							var tempTarget = map[xx, gridY]; 
						
							if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){// and that node has an occupant
								ds_list_add(targetList, tempTarget);
								break;// get out of for loop
							}
						}		
					}
				}
				
				var target = ds_list_find_value(targetList, 0); 
				if(target.occupant != noone){
					var occu = target.occupant
						occu.targetedBy = id;
				}
				global.cursor.state = "nothing";
				actState = "action standby";
				ds_priority_add(global.actionQueue, id, SPD);
			}
			
			
			//if shot from above, aim right
			if(targetedBy.gridY > gridY){
				for(var xx = gridX + range; xx > gridX; xx--){
					if(xx <= rBound){
						var tempTarget = map[xx, gridY]; 
						
						if(instance_exists(tempTarget) && tempTarget.occupant && !tempTarget.occupant.incapacitated){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
						}
					}		
				}
				
				if(ds_list_empty(targetList)){
					for(var xx = gridX + range; xx > gridX; xx--){
						if(xx <= rBound){
							var tempTarget = map[xx, gridY]; 
						
						if(instance_exists(tempTarget)){// and that node has an occupant
							ds_list_add(targetList, tempTarget);
							break;// get out of for loop
							}
						}		
					}
				}
				
			
				var target = ds_list_find_value(targetList, 0); 
				if(target.occupant != noone){
					var occu = target.occupant
						occu.targetedBy = id;
				}
				global.cursor.state = "nothing";
				actState = "action standby";
				ds_priority_add(global.actionQueue, id, SPD);
				
			}
		
		break; 

		
	}

	targetedBy = noone;
	
	}
}

event_inherited();

