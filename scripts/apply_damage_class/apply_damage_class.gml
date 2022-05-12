// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_damage_class(target){
	
	switch(target.damageClass){
		case "default":
			target.hp -= action.damage.damage;
			target.damaged = true;
			target.shake = true;	
		break;
		

		case "fire weak":
			if(action.damage.tempDamageType == "fire"){
				target.hp -= action.damage.tempDamageType;
				target.damaged = true;
				target.shake = true;
				
			}
		break;
		
		case "bomb":
			if(hp > 0){
				if(action.damage.tempDamageType == "fire"){
					find_bomb_targets(target);
					target.shake = true;
					target.damaged = true;
					ds_queue_enqueue(global.actionQueue, target);
					target.actState = "action standby";
					target.damageClass = "default";
				
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
	
	if(target.hp <= 0){
		ds_queue_enqueue(global.deathQueue, target);	
	}
}