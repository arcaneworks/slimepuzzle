if(room_get_name(room) != "test_room"){
	//if you've killed all the enemies
	for(var ii = 0; ii < instance_number(obj_enemy); ii++){
		var tempEnemy = instance_find(obj_enemy, ii); 	
		//if there is an enemy that is alive, break out of for loop
		if(!tempEnemy.dead){
			break;	
		}else{
			//if you reach the end of the enemy total 
			if(ii == instance_number(obj_enemy) - 1){
				levelComplete = true;
			}	
		}
	}
}
// load level end object if level is complete
if(levelComplete && !instance_exists(obj_gameover)){
	instance_create_layer(x, y, "Gameover", obj_gameover);	
}	



switch(actionState){

	case "standby": //initializes the standby queue of enemies to attack. 
			
		if(ds_priority_size(global.actionQueue) > 0){ //if the queue has any standbyActors in it
					
			standbyActor = ds_priority_find_max(global.actionQueue); //take the first standbyActor in the queue
				
			if(instance_exists(standbyActor)){
				standbyActor.actTurn = true; //make it their turn 
						
			}else{
				ds_priority_delete_max(global.actionQueue);
			}					
				
		}
	break;
	
}

