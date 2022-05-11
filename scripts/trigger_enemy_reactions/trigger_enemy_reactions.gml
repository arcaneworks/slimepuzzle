//this script looks at all the 
function trigger_enemy_reactions(){
	
		with(obj_enemy){
			if(id != other.id){ //IF THE fighter ISN'T ME
				
				if(ds_list_size(reactList) > 0){
					
					if(ds_list_find_index(reactList, map[other.gridX, other.gridY]) != -1){
						
						ds_list_add(targetList, other.id); 
						ds_queue_enqueue(global.actionQueue, id);
						actState = "action standby";
					
					}
				}
			}
		}
}