// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_damage_class(){
	switch(damageClass){
		case "default":
			hp -= damage;
			damaged = true;
			shake = true;	
		break;
		
		
		case "fire weak":
			if(damageType == "fire"){
				hp -= damage;
				damaged = true;
				shake = true;
				
			}
		break;
		
		case "bomb":
			if(hp > 0){
				if(damageType == "fire"){
					find_bomb_targets();
					shake = true;
				
					ds_queue_enqueue(global.gameObj.actionQueue, id);
					global.gameObj.state = "standby";
					actState = "action standby";
					damageClass = "default";
				
				}
			}
		
		break;
		
		case "director":
		
		break;
		
		case "breakable":
		
			 breaking = true; 
			 
			 shake = true;
		
		break;
		
	}
}