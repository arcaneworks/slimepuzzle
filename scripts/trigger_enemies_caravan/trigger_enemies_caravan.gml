function trigger_enemies_caravan() {

		with(obj_bomb){	
			if(map[gridX, gridY].onScreen){
				for(var xx = 0; xx < map_width; xx++){
					var node = map[xx, other.advanceNumber];
					if(ds_list_find_index(reactList, node) != -1){ //if the node that the actor is standing in is in the reactList

						ds_queue_enqueue(global.actionQueue, id);
				
						for(var ii = 0; ii < ds_list_size(reactList); ii++){
					
							var target = ds_list_find_value(reactList, ii);		
					
							if(target.occupant != noone){
								target = target.occupant; 	
								if(target.vehicle){
									target.vfxNode = ds_list_find_value(reactList,ii);
								}
							}
					
							ds_list_add(targetList, target); 				
						}
				
			
						actState = "action standby";
						reaction = true;
					}
				}
			}
		}
		
		with(obj_fighter_par){
			if(map[gridX, gridY].onScreen){
				for(var xx = 0; xx < map_width; xx++){
						var node = map[xx, other.advanceNumber];
					if(ds_list_find_index(reactList, node) != -1){ //if the node that the actor is standing in is in the reactLis
						ds_queue_enqueue(global.actionQueue, id);
						ds_list_add(targetList,node);
						actState = "action standby";
						reaction = true;
					}
				}
			}
		}

}
