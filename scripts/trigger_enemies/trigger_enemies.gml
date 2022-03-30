function trigger_enemies() {
	if(!invisible){
	
		with(obj_bomb){	
	
			if(ds_list_find_index(reactList, map[other.gridX, other.gridY]) != -1){ //if the node that the actor is standing in is in the reactList

				ds_queue_enqueue(global.gameObj.actionQueue, id);
				
				for(var ii = 0; ii < ds_list_size(reactList); ii++){
					
					var target = ds_list_find_value(reactList, ii);		
					
					if(target.occupant != noone){
						target = target.occupant; 	
					}
					
					ds_list_add(targetList, target); 				
				}
				
			
				actState = "action standby";
				reaction = true;
			}
	
		}
	
	
		with(obj_fighter_par){
			
			if(ds_list_find_index(reactList, map[other.gridX, other.gridY]) != -1){ //if the node that the actor is standing in is in the reactList
	
				ds_queue_enqueue(global.gameObj.actionQueue, id);
				ds_list_add(targetList, other.id);
				actState = "action standby";
				reaction = true;
	
			}
		}
	}
	




}
