if(room_get_name(room) == "game_room" && instance_number(obj_enemy) == 0){ //if you've killed all the enemies
	if(!instance_exists(obj_gameover)){
		instance_create_layer(x, y, "Gameover", obj_gameover);	
	}	
}



switch(actionState){

	case "standby": //initializes the standby queue of enemies to attack. 
			
		if(ds_queue_size(global.actionQueue) > 0){ //if the queue has any standbyActors in it
					
			standbyActor = ds_queue_head(global.actionQueue); //take the first standbyActor in the queue
				
			if(instance_exists(standbyActor)){
				standbyActor.actTurn = true; //make it their turn 
						
			}else{
				ds_queue_dequeue(global.actionQueue);
			}					
				
		}
	break;
	
}

