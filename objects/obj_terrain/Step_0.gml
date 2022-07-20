
if(dead){
	x = -100000;
	y = -100000;
	
}

switch(terrainString){
	case "FIRE":
		depth = obj_actor.depth - 1;
	break; 
	
	case "HOLE":
		depth = obj_node.depth + 1;
	break;
	
	case "WEB":
		depth = obj_node.depth -1 ;
	break;
	
	case "BONFIRE OFF":
		depth = obj_node.depth + 1 ;
	break;
	case "BONFIRE":
		depth = obj_node.depth - 1 ;

	break;
}

	if(hasAction){
		switch(actState){
		
		case "action standby":
			if(actTurn){
				if(map[gridX, gridY].occupant == ds_list_find_value(targetList, 0)){
					actState = "create effect";
				}else{
					actState = "wait";	
				}
			}

		break;
		
		case "create effect":

			//if disabled, clear targets 		
				//if there are any targets in the targetlist
			if(ds_list_size(targetList) > 0){ 
					
				//go through list, create vfx at each target
				for(var j = 0; j < ds_list_size(targetList); j++){ 
					target = ds_list_find_value(targetList, j); 
					create_action_vfx();
					snapshot_target_struct();
					
				}

				//play startSfx
				if(action.sfx.startSfx){
					audio_play_sound(action.sfx.startSfx, 0, false);	
				}		
				
					actState = "apply action"; 
			}else{ //if there is no target
				actState = "wait";
			}
		
		break;
		
		case "apply action":
			//once the vfx has finished (and shove is completed if necessary), apply the action to the target
			if(!instance_exists(vfx)){ 
				//if there is a target in the targetlist
				if(ds_list_size(targetList) > 0){ 
						
					for(var j = 0; j < ds_list_size(targetList); j++){ //go through list, create vfx at each target
						target = ds_list_find_value(targetList, j); 
								
							apply_action();
							
						}		
					
					}
					
					actState = "wait";
				}	

			break;
		
		
		case "wait":
			
			
			//kills all targets at 0 hp
			if(ds_list_size(targetList) > 0){
				for(var j = 0; j < ds_list_size(targetList); j++){ 
					target = ds_list_find_value(targetList, j); 
							
						// if the target is a node and has an occupant
						if(instance_exists(target) && target.node){ 
							if(target.occupant){
									target = target.occupant;
							}else{
								//if there is no occupant, but there is a terrain
								//target the terrain
								if(target.terrain != noone){
									target = target.terrain; 
								}
							}
						}		
						if(instance_exists(target) && target != noone){ //if the target exists 
							
							if(target.component){ //and its a component
								if(target.hitable){ //if the target is able to be hit (not a node)
									if(target.hp <= 0){
										ds_queue_enqueue(global.deathQueue, target);	
										target.deathWait = true;
										
									}
								}
							}
						}
					}	
				}
			
			
			var actQueue = global.actionQueue;
			var headActor = ds_priority_find_max(actQueue);
				
			//If this actor is the head of the action queue (and finished applying action), dequeue it. 
			//the actor loses action
			
			if(headActor == id){
				ds_list_clear(targetList);
				ds_priority_delete_max(actQueue);
				
				actTurn = false;
				actState = "idle";
			}
			
			//if there are no actos queued

		break;	
		
	}
	}