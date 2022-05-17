var roomName = room_get_name(room);
var enemy_number = instance_number(obj_enemy);
if(roomName != "test_room" && enemy_number == 0){ //if you've killed all the enemies
	if(!instance_exists(obj_gameover)){
		instance_create_layer(x, y, "Gameover", obj_gameover);	
	}	
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

