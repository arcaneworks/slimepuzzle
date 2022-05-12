event_inherited();



#region actState MACHINE


	switch(actState){
		
		case "action standby":
			if(actTurn){
				actState = "create effect";
			}

		break;
		
		case "create effect":

			//if incapacitated, clear targets 		
			if(incapacitated){
				ds_list_clear(targetList);		
			}
				//if there are any targets in the targetlist
			if(ds_list_size(targetList) > 0){ 
					
				//go through list, create vfx at each target
				for(var j = 0; j < ds_list_size(targetList); j++){ 
					target = ds_list_find_value(targetList, j); 
					create_action_vfx();
				}

				//play startSfx
				if(action.sfx.startSfx){
					audio_play_sound(action.sfx.startSfx, 0, false);	
				}	
				
				if(action.effect.shove){
					actState = "shove target";
					target = noone;
				}else{
					actState = "apply action"; 
				}
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
							
							// if the target is a node and has an occupant
							if(target.node){ 
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
							apply_action();
						}		
					}		
					ds_list_clear(targetList);
					actState = "wait"; 
				}	

			break;
		
		case "shove target":
		
			//once the vfx has finished && I havent shoved my target(s), then shove them
			if(!instance_exists(vfx) && !finShove){ 	
				if(ds_list_size(targetList) > 0){
					for(var j = 0; j < ds_list_size(targetList); j++){ //go through list, create vfx at each target
						var tempTarget = ds_list_find_value(targetList, j); 
						
						if(tempTarget.component){
							target = tempTarget;	
						}else{
							if(tempTarget.node){
								if(tempTarget.occupant != noone){
									target = tempTarget.occupant	
								}	
							}
						}
						
						apply_shove();
							
					}
				}
					finShove = true;
			}
			
			//if i've shoved my target(s) and waited for them to finish moving,
			//apply the action
				if(target != noone && finShove && target.moveState == "idle"){
					finShove = false;
					actState = "apply action";
				}

		
		break;
		
		
		case "wait":
			var actQueue = global.actionQueue;
			var headActor = ds_queue_head(actQueue);
				
			//If this actor is the head of the action queue (and finished applying action), dequeue it. 
			//the actor loses action
			if(headActor == id){
				ds_queue_dequeue(actQueue);
				canAct = false;
				actTurn = false;
			}
			
			//if there are no actor's queued
			if(ds_queue_empty(actQueue)){
				//&&  THIS actor is the cursor's selected Actor
				if(global.cursor.selectedActor == id){
					//&& there is nobody that is still waiting to die
					if(ds_queue_empty(global.deathQueue)){
						
						//if you can act, then go to action target
						if(canAct){
							global.cursor.getTargets = true;
							global.cursor.state = "action target";
							actState = "idle";
						}else{
							//if i can't act, but can move
							if(canMove){
					
								global.cursor.getMoves = true;
								global.cursor.state = "move";
								actState = "idle";
							}else{
								//if i can't act OR move
								global.cursor.selectedActor = noone; 
								global.cursor.state = "idle";
								actState = "idle";
							}
						}	
					}
				}else{
					
					actState = "idle";	
					
				}
			
			}
			
						
		break;	
		
	}


#endregion 
