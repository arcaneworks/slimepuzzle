if(instance_number(obj_enemy) == 0){ //if you've killed all the enemies
	if(!instance_exists(obj_gameover)){
		instance_create_layer(x, y, "Gameover", obj_gameover);	
	}	
}



switch(actionState){

	case "standby": //initializes the standby queue of enemies to attack. 
			
		if(ds_queue_size(actionQueue) > 0){ //if the queue has any standbyActors in it
					
			standbyActor = ds_queue_head(actionQueue); //take the first standbyActor in the queue
				
			if(instance_exists(standbyActor)){
				standbyActor.actTurn = true; //make it their turn 
						
			}else{
				ds_queue_dequeue(actionQueue);
			}					
				
		}else{//if there are no standbyActors left in the queue 
				
			actionState = "idle";
				
		}
			
	break;
	
}	