event_inherited();

if(canAct || canMove){
	color = c_white;
}else{
	color = c_gray;
	outlineCol = c_gray;
}
	

switch(moveState){  //MOVESTATE	
		
	case "init advance":
		
		
		if(map[gridX,gridY].pushNode){
			advancing = true;
			push = true;
			var pushedComp = map[gridX, gridY + 1].occupant;
			push_into(id, pushedComp);		 
		}else{
			moveState = "idle";		
		}
			
	break;
	
	
}

#region actState MACHINE


	switch(actState){
		
		
		case "action standby":
			
			actState = "create effect";

	
		break;
		
		case "action event":
		
			if(!instance_exists(obj_actionevent)){
				actState = "create effect";		
			}
		
		
		break;
		
		case "create effect":

					
			if(incapacitated){
				ds_list_clear(targetList);		
			}
				
			if(ds_list_size(targetList) > 0){ //if there is a target in the targetlist
					
				if(ds_list_size(targetList) == 1){ //if there is only one target
					target = ds_list_find_value(targetList, 0);
		
					create_action_vfx();
				}else{//if there are multiple target
					for(var j = 0; j < ds_list_size(targetList); j++){ //go through list, create vfx at each target
						target = ds_list_find_value(targetList, j); 
						create_action_vfx();
					}
				}
					
				if(action.sfx.startSfx){
					audio_play_sound(action.sfx.startSfx, 0, false);
						
				}
				
				if(action.effect.shove && target.component){
					actState = "wait push";
				}else{			
					actState = "start attack"; 
				}
					
			}else{ //if there is no target
				actState = "wait";
			}
		
		break;
		
		case "wait push":
			if(!instance_exists(vfx) && !finPush){ //once the vfx has finished
				
				if(ds_list_size(targetList) > 0){ //if there is a target in the targetlist
					
					if(ds_list_size(targetList) == 1){ //if there is only one target
						
						apply_shove();
						finPush = true;
					}else{//if there are multiple target
						for(var j = 0; j < ds_list_size(targetList); j++){ //go through list, create vfx at each target
							target = ds_list_find_value(targetList, j); 
							apply_shove();
							finPush = true;
						}		
					}
				}					
			}
			
			if(instance_exists(target) && target.component){
				if(finPush && target.moveState == "idle"){
					finPush = false;
					actState = "start attack";
				
				}
			}else{
				actState = "wait";
			}
		
		break;
		
		case "start attack":
			canAct = false;
			
		
			if(!instance_exists(vfx)){ //once the vfx has finished
				
				if(ds_list_size(targetList) > 0){ //if there is a target in the targetlist
					
					if(ds_list_size(targetList) == 1){ //if there is only one target
						
						apply_action();
					}else{//if there are multiple target
						for(var j = 0; j < ds_list_size(targetList); j++){ //go through list, create vfx at each target
							target = ds_list_find_value(targetList, j); 
							apply_action();
						}		
					}
				}		
				actState = "end attack";
			}
			
				
		
		break;
		
		case "end attack":
		
		if(instance_exists(target) && target.component){
			if(target.moveState == "idle"){
				
				 if(instance_exists(target) && target.hitable){
				
					if(target.damagable && !target.applyDamage){
						target = noone;
						actState = "wait"; 
					}else{
						target = noone; 
						actState = "wait";
					}
				}else{
					target = noone;
					actState = "wait";
				}
			
				if(ds_queue_head(global.gameObj.actionQueue) == id){
					ds_queue_dequeue(global.gameObj.actionQueue);
					actTurn = false;
				}
			}
		}else{
			canAct = false;
			actState = "wait";	
		}
			
			
			ds_list_clear(targetList);
				
		break;
		
		//case "defending":
		//	if(keyboard_check_pressed(ord(defendKey)) && defendTimer == 0 && defendBuffer == 0){
		//		defending = true;
		//		defendTimer = defendTime;
		//		defendBuffer = defendTime * 2;
		//	}
			
		//	if(defendTimer > 0){
		//		defendTimer--	
		//	}else{
		//		defending = false;
		//	}
			
		//	if(defendBuffer > 0){
		//		defendBuffer--;
		//	}
		
		//break;
		
		case "wait":
		
			//applies status if applicable
			
			if(!instance_exists(obj_textbox)){
				
				var tempActor = ds_queue_head(global.gameObj.actionQueue);
				
				//IF THIS ACTOR IS THE HEAD OF THE QUEUE
				
				
				if(ds_queue_head(global.gameObj.actionQueue) == id){
					ds_queue_dequeue(global.gameObj.actionQueue);
					canAct = false;
					actTurn = false;
				}
				
				//resets global.gameObj.currActor, forcing obj_game to find new currActor 
				if(ds_queue_empty(global.gameObj.actionQueue)){
					//IF THIS AGENT IS THE CURRENT AGENT
					if(global.gameObj.currActor == id){
						
						global.gameObj.currActor = noone; 
						global.cursor.selectedActor = noone; 
						global.gameObj.turnPos++;
					
					}

						myTurn = false; 
						actState = "idle";
						timer = defaultTimer;
				
				}	
			}
			
			ds_list_clear(targetList);
			target = noone;
			reaction = false;
			miss = false;
			canAct = false;
			global.cursor.selectedActor = noone; 
			global.cursor.state = "idle";
				
		break;
		
		//case "reaction": 
		
		//	if(hasReaction && reaction){
		//		trigger_enemies();
		//		get_reaction();
				
		//		ds_queue_enqueue(global.gameObj.actionQueue, id);
				
		//		for(var ii = 0; ii < ds_list_size(reactList); ii++){
					
		//			var target = ds_list_find_value(reactList, ii);		
					
		//			if(target.occupant != noone){
		//				target = target.occupant; 	
		//			}
					
		//			ds_list_add(targetList, target); 				
		//		}
				
			
		//		actState = "action standby";
				
		//	}else{
		//		actState = "idle"; 
				
		//	}
		
		//break;
		
	
		
	}

#endregion 
