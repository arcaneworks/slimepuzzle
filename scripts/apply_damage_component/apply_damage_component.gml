// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_damage_component(component){
	if(component.damagable){
		var targetTargetSize = ds_list_size(component.victimList);
		if(targetTargetSize > 0){
			for(var i =0; i < targetTargetSize; i ++){
				ds_list_find_value( component.victimList,i).disabled = true;
			}
		}
		
		if(action.damage.backstab == true){
			
			if(component.faces && component.facingDir == facingDir){
			
				
				var tempDamage = action.damage.damage * 2;	
			}else{
				 tempDamage = action.damage.damage;	
			}
			
		}else{
			var tempDamage = action.damage.damage;	
			
		}
		
		switch(component.damageClass){
			case "default":
			
				component.hp -= tempDamage;
				component.damaged = true;
				component.shake = true;	
				component.displayHp = true;
			break;
		

			case "fire weak":
				if(action.damage.tempDamageType == "fire"){
					component.hp -= tempDamage;
					component.damaged = true;
					component.shake = true;
					component.displayHp = true;
				
				}
			break;
		
			case "bomb":
				if(hp > 0){
					if(action.damage.tempDamageType == "fire"){
					find_bomb_targets(component);
						component.disabled = false;
						component.shake = true;
						component.damaged = true;
						component.displayHp = true;
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
					component.displayHp = true;
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
			else if(action.damage.tempDamageType == "fire"){
					
		 			var newBonfire = instance_create_layer(component.x, component.y, "Instances", obj_director_fire);
					audio_play_sound(s_fire4, 1, false);
					newBonfire.dead = true;
					var tempStruct = snap_deep_copy(newBonfire.componentStruct);
			
					copy_component_to_struct(newBonfire,tempStruct);
					ds_priority_add(newBonfire.undoList, tempStruct, global.totalMoves);
					newBonfire.dead = false;
			
			
					copy_component_to_struct(component,tempStruct);
					ds_priority_add(component.undoList, tempStruct, global.totalMoves);
					newBonfire.gridX = component.gridX;
					newBonfire.gridY = component.gridY;
					newBonfire.facingDir = component.facingDir;
		            newBonfire.redirect = component.redirect;
		            newBonfire.targetedBy = id
					newBonfire.currNode = component.currNode;
					ds_list_clear(targetList);
					ds_list_add(targetList, newBonfire);
					//actor.target = newBonfire;
					map[component.gridX, component.gridY].occupant = newBonfire; 
					component.dead = true;
				}
			break;
			
			
		}
		
	}
}