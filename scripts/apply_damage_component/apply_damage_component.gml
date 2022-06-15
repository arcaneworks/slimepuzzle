// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_damage_component(component){
	if(component.damagable){
		switch(component.damageClass){
			case "default":
				component.hp -= action.damage.damage;
				component.damaged = true;
				component.shake = true;	
			break;
		

			case "fire weak":
				if(action.damage.tempDamageType == "fire"){
					component.hp -= action.damage.damage;
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
						ds_priority_add(global.actionQueue, component,component.SPD);
						component.actState = "action standby";
						component.damageClass = "default";
				
					}
				}
	
			break;
		
			case "director":
		
			break;
		
			case "breakable":
				if(action.damage.damage > 0){
					component.hp -= 1;
					component.damaged = true;
					component.shake = true;	
				}
		
			break;
		
		}
	
		
	}else{
		switch(component.damageClass){
			case "director":
				if(action.targeting.range > 1){
					component.targetedBy = id;
					component.redirect = true;
				}
			break;
			
			
		}
		
	}
}