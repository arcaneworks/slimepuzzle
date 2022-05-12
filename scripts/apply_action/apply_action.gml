// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_action(){
	if(instance_exists(target) && target != noone && target.component){
		if(target.hitable){ //if the target is able to be hit (not a node)
			
			apply_damage_class(target);
			
			if(target.hp <= 0){
				waitForDeath = true;	
			}
			
			if(is_string(action.effect.status)){ // give status
				target.status = giveStatus;
			}
					
			if(action.effect.rejuvenate){
				target.canAct = true; 
				target.canMove = true;
				
			}		
			if(action.sfx.endSfx != noone && !action.effect.shove){
				audio_play_sound(action.sfx.endSfx, 0, false);
			}
			

		}
	}else{
		if(instance_exists(target) && target.terrain){
			switch(target.terrainString){
				
				case "WEB":
					if(action.damage.damageType == "fire"){
						
						instance_destroy(target);
						map[target.gridX,target.gridY].terrain = noone;
						
					}	
				break;
				
				case "BONFIRE OFF":
					if(action.damage.damageType == "fire" || action.damage.tempDamageType == "fire"){
						var newInst = instance_create_layer(target.x, target.y, "Instances", obj_bonfire);
						
						map[target.gridX,target.gridY].terrain = newInst;
						newInst.gridX = target.gridX;
						newInst.gridY = target.gridY;
						instance_destroy(target);
						
					}	
				break;
				
				case "BONFIRE":
					if(action.damage.damageType == "physical" || action.damage.tempDamageType == "physical"){
						var newInst = instance_create_layer(target.x, target.y, "Instances", obj_bonfire_off);
						map[target.gridX,target.gridY].terrain = newInst;
						newInst.gridX = target.gridX;
						newInst.gridY = target.gridY;
						instance_destroy(target);
						
					}	
				break;
				
			}
			
		}
	}
	
	action.damage.tempDamageType = action.damage.damageType;
}


