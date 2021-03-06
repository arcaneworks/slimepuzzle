if(dead){
	// move dead things to the graveyard, far offscreen
	x = -10000;
	y = -10000;
}


// set sprite based on facing direction if applicable
if(faces){
	switch(facingDir){
		case dir.north:
			image_xscale = 1;
			var sprite = asset_get_index("spr_" + class + "_n");
			sprite_index = sprite;
			xOffset = 0;
		break;
	
		case dir.east:
			image_xscale = 1;
			var sprite = asset_get_index("spr_" + class + "_e");
			sprite_index = sprite;
			xOffset = 0;
		break;
	
		case dir.south:
			image_xscale = 1;
			var sprite = asset_get_index("spr_" + class + "_s");
			sprite_index = sprite;
			xOffset = 0;
		break;
	
		case dir.west:
			var sprite = asset_get_index("spr_" + class + "_w");
			
			if(sprite > -1){
				sprite_index = sprite;
				xOffset = 0;
			}else{
				image_xscale = -1;
				var sprite = asset_get_index("spr_" + class + "_e");
				sprite_index = sprite;
				xOffset = node_size;
			}
		break;

	}
}

//shake up the sprite if damaged
if(shake){
	shakeTimer --;
	if(shakeTimer == 0){
		shake = false;	
		shakeTimer = 15;
	}
}

// set hp display/outline flags if hovered
if(global.cursor.hoverNode != noone && global.cursor.hoverNode.occupant == id && damaged == false){
	hovered = true;	
}else{
	hovered = false;	
}
// deincrement display timer if damaged
if(displayHp && damaged){
	
	if(hpTimer > 0){
		hpTimer--;
		
		if(hpTimer % 10 == 0){
			valuebarAlpha = 0;
			blink = false;	
		}else{
			blink = true;
			valuebarAlpha = .75;
		}
	}else{
		displayHp = false; 	
		damaged = false;
		hpTimer = displayTime;
	}
	
}else{
	if(hovered){
		displayHp = true;
	}else{
		if(global.cursor.selectedActor == id && !targeted){
			displayHp = true;	
		}else{
			displayHp = false;	
		}
	}
	
}
//if this actor died and is in the death queue

if(!ds_queue_empty(global.deathQueue)){
	if(ds_queue_head(global.deathQueue) == id){
			
			if(ds_priority_find_max(global.actionQueue) == id){
				ds_priority_delete_max(global.actionQueue);	
			}
			if(alpha > 0){
				alpha -= .08;
			}else{
				map[gridX, gridY].occupant = noone; //clear occupancy of node
				ds_queue_dequeue(global.deathQueue);
				dead = true;
				exit;
			}
	}
}

if(applyStatus){ //APPLY STATUS
	apply_status();
	applyStatus = false;	
}

//#region sets "selected" and "hovered" variables based on global.cursor.selectedActor and hoverNode.occupant

//		if(global.cursor.hoverNode != noone && global.cursor.hoverNode.occupant == id){
//			hovered = true;
//		}else{
//			hovered = false;
//		}
//		if(hovered){	
//			displayHp = true;
//		}else{
//			if(!applyDamage){
//				displayHp = false;	
//			}
//		}
//#endregion 


switch(moveState){

	case "idle":
	
	
	break;
	
	
	case "start path":
		if(path_exists(movementPath)){ //cleans up movementPath in case one already exists
			path_delete(movementPath); 		
		}
		if(instance_exists(moveToNode)){
			if(actor || element){
				if(moveToNode.occupant != noone || (moveToNode.gridX == currNode.gridX && moveToNode.gridY == currNode.gridY)){ // IF THERE IS A COLLISION BETWEEN ACTORS movementPath =  path_add(); //add path of movementPath
					movementPath =  path_add();
					path_set_kind(movementPath,2);
					path_set_closed(movementPath, false);
			
					var xDif = noone;
					var yDif = noone;
			
					if(x > moveToNode.x){
						xDif = -(x - moveToNode.x) / 2;
						xDif = -(x - moveToNode.x) / 2;
					}else{
						xDif = (moveToNode.x - x) / 2;	
					}
			
					if(y > moveToNode.y){
						yDif = -(y - moveToNode.y) / 2
					}else{
						yDif = (moveToNode.y - y) / 2;	
					}
					path_add_point(movementPath, x, y, 100);
					path_add_point(movementPath, x + xDif, y + yDif, 100);
					path_add_point(movementPath, x, y, 100);
					//moveActor.applyDamage = true;

				}else{ //there is no occupant to move 
			
					movementPath =  path_add(); //add path of movementPath
					path_set_kind(movementPath, 1);
					path_set_closed(movementPath, false);
					path_add_point(movementPath, x, y, 100);
					path_add_point(movementPath, moveToNode.x, moveToNode.y, 100);
					
					map[gridX, gridY].occupant = noone; //clear current node occupancy 
					
					prevNode = map[gridX, gridY]; // sets previous node
					
					gridY = moveToNode.gridY; //assigns new gridX and gridY
					gridX = moveToNode.gridX;
					
					currNode = map[gridX, gridY];
					
					currNode.occupant = id; //set new occupancy for moveToNode

					//begin moving along path
		
				}	
			}
			path_start(movementPath, moveSpeed, 0, true); //send em packin
			moveState = "moving";
		}
	break;
	
	case "start advance":
		if(instance_exists(moveToNode)){ // if moveToNode exists
				if(moveToNode.occupant){ // IF THERE IS A COLLISION BETWEEN ACTORS 
					collision = true;					
					create_moveTo_path(); //sets points/kinds of 
				}else{ //there is no occupant to move 
					create_moveTo_path();
				}
			path_start(movementPath, moveSpeed, 0, true); //send em packin
			shoved = true;
			moveState = "moving";
		}
	break;
}

