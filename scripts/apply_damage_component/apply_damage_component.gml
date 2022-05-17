// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_damage_component(component){
	
	switch(component.damageClass){
		case "default":
			component.hp -= action.damage.damage;
			component.damaged = true;
			component.shake = true;	
		break;
		

		case "fire weak":
			if(action.damage.tempDamageType == "fire"){
				component.hp -= action.damage.tempDamageType;
				component.damaged = true;
				component.shake = true;
				
			}
		break;
		
		case "bomb":
			if(hp > 0){
				if(action.damage.tempDamageType == "fire"){
					find_bomb_targets(component);
					component.shake = true;
					component.damaged = true;
					ds_queue_enqueue(global.actionQueue, component);
					component.actState = "action standby";
					component.damageClass = "default";
				
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
	
	if(component.hp <= 0){
		ds_queue_enqueue(global.deathQueue, component);	
	}
}