// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fill_reaction_list(list, reactionType, range){
	var oX = gridX;
	var oY = gridY;
	var lBound = 0; //boundry on left side of map
	var rBound = map_width - 1; //right side
	var bBound = 0; //bottom side
	var tBound = map_height - 1; //top side
	ds_list_clear(list);
	wipe_nodes();
	switch(reactionType){
		
		case "melee":
			for(var xx = oX - range; xx <= oX + range; xx++){
				if(xx >= lBound && xx <= rBound){
					if(xx < oX){
						ds_list_add(list, map[xx, oY]);
					}
					
					if(xx > oX){
						ds_list_add(list, map[xx, oY]);
					}
					//map[xx, oY].actionNode = true;
				}
			}
			
			for(var yy = oY - range; yy <= oY + range; yy++){
				if(yy >= bBound && yy <= tBound){	
					
					if(yy < oY){
						ds_list_add(list, map[oX, yy]);
					}		
					if(yy > oY){
						ds_list_add(list, map[oX, yy]);
					}		
					map[oX, yy].actionNode = true;
				}				
			}
			
		break;
		
		case "bow":
			switch(facingDir){
				
				case dir.north:
				
					for(var yy = oY + 1; yy < oY + range; yy++){ //searches tempTargets for occupants
						if(yy <= tBound){ //if y pos is in boundry of map
						
							var tempTarget = map[oX,yy];
				
							if(instance_exists(tempTarget)){
								if(tempTarget.occupant){
									ds_list_add(list, tempTarget);
									break;
								}else{
									ds_list_add(list, tempTarget);	
									
								}
							}
						}
					}
				
				break;
					
		
				case dir.east:
				
					for(var xx = oX + 1; xx < oX + range; xx++){
						if(xx <= rBound){
							var tempTarget = map[xx, oY];
							if(instance_exists(tempTarget)){
								if(tempTarget.occupant){
									ds_list_add(list, tempTarget);
									break;
								}else{
									ds_list_add(list, tempTarget);	
									
								}
							}
						}				
					}
					
				break;
				
				case dir.south:
	
					for(var yy = oY - 1; yy > oY - range; yy--){ // start from closest node in range
						if(yy >= bBound){// if that node is on map
						
							var tempTarget = map[oX, yy]; 
							
							if(instance_exists(tempTarget)){
								if(tempTarget.occupant){
									ds_list_add(list, tempTarget);
									break;
								}else{
									ds_list_add(list, tempTarget);	
									
								}
							}
						}
					}	
					
				break;
				
			
				
				case dir.west:
				
					for(var xx = oX - 1; xx > oX - range; xx--){
						if(xx >= 0){
							var tempTarget = map[xx, oY]; 
						
							if(instance_exists(tempTarget)){
								if(tempTarget.occupant){
									ds_list_add(list, tempTarget);
									break;
								}else{
									ds_list_add(list, tempTarget);	
									
								}
							}
						}		
					}
				
				break;
				
			}	
				
		break;
		
		case "cone":
			switch(facingDir){
				case dir.south:
					for(yy = oY - range; yy <= oY; yy++){
						var diff = yy-oY;
						if(diff <0){
							diff *= -1;
							
							}
							diff /= 2;
						for(xx = oX -diff; xx<= oX + diff; xx++){
							if(xx < lBound || xx > rBound)
								 continue;
							if(yy <bBound || yy > tBound)
								continue;
							ds_list_add(list, map[xx,yy])
						}
					}
					break;
				case dir.east:
				for(xx = oX + range; xx <= oX; xx--){
						var diff = xx-oX;
						if(diff <0){
							diff *= -1;
							
							}
							diff /= 2;
						for(yy = oY -diff; yy<= oY + diff; yy++){
							if(xx < lBound || xx > rBound)
								 continue;
							if(yy <bBound || yy > tBound)
								continue;
							ds_list_add(list, map[xx,yy]) 
						}
					}
				break;
				case dir.north:
				for(yy = oY + range; yy <= oY; yy--){
						var diff = yy-oY;
						if(diff <0){
							diff *= -1;
							
							}
							diff /= 2;
						for(xx = oX -diff; xx<= oX + diff; xx++){
							if(xx < lBound || xx > rBound)
								 continue;
							if(yy <bBound || yy > tBound)
								continue;
							ds_list_add(list, map[xx,yy]) 
						}
					}
				break;
				case dir.west:
				for(xx = oX - range; xx <= oX; xx++){
						var diff = xx-oX;
						if(diff <0){
							diff *= -1;
							
							}
							diff /= 2;
						for(yy = oY -diff; yy<= oY + diff; yy++){
							if(xx < lBound || xx > rBound)
								 continue;
							if(yy <bBound || yy > tBound)
								continue;
							
							ds_list_add(list, map[xx,yy])
							
						}
					}
				break;
			
			}
		
	}
	
	
}