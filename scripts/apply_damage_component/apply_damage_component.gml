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
			if(action.damage.tempDamageType == "fire"){
					var burnable = component;
		 			var newBonfire = instance_create_layer(burnable.x, burnable.y, "Instances", obj_director_fire);
					audio_play_sound(s_fire4, 1, false);
					newBonfire.dead = true;
					var tempStruct = snap_deep_copy(newBonfire.componentStruct);
			
					copy_component_to_struct(newBonfire,tempStruct);
					ds_priority_add(newBonfire.undoList, tempStruct, global.totalMoves);
					newBonfire.dead = false;
			
			
					copy_component_to_struct(burnable,tempStruct);
					ds_priority_add(burnable.undoList, tempStruct, global.totalMoves);
					newBonfire.gridX = burnable.gridX;
					newBonfire.gridY = burnable.gridY;
					newBonfire.facingDir = burnable.facingDir;
		            newBonfire.redirect = burnable.redirect;
		            newBonfire.targetedBy = burnable.targetedBy;
					ds_list_clear(targetList);
					ds_list_add(targetList, newBonfire);
					//actor.target = newBonfire;
					map[burnable.gridX, burnable.gridY].occupant = newBonfire; 
					burnable.dead = true;
				}
				if(action.targeting.range > 1){
					component.targetedBy = id;
					component.redirect = true;
				}
			break;
			
			
		}
		
	}
}