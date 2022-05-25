// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_terrain(component, node){
	var terrain = node.terrain;
	var infoStruct = component.componentStruct.info;
	if(terrain != noone){
		switch(terrain.terrainString){
		
			case "GROUND":
				component.incapacitated = false; 
				infoStruct.incapacitated = false;
			break;
			
			case "FIRE":
				if(component.class == "rock"){
					instance_destroy(terrain);
					node.terrain = noone;	
				}
				 
			break;
			
			case "BONFIRE":
				if(component.class == "rock"){
					instance_destroy(terrain);
					node.terrain = noone;	
				}else{
					if(component.actor){
						if(component.damageClass == "bomb"){
							find_bomb_targets(component);
							component.shake = true;
							component.damaged = true;
							ds_priority_add(global.actionQueue, component,component.SPD);
							component.actState = "action standby";
							//component.damageClass = "default";
							
						}
						else {
						component.hp -= component.hp;
						component.damaged = true;
						component.shake = true;
				
								
						}
						
					}
					
				}
				 
			break;
			
			case "HOLE":
				
			
				if(component.class == "rock"){
					ds_queue_enqueue(global.deathQueue, component);	
					component.deathWait = true;
					instance_destroy(terrain);
					node.occupant = noone;
					node.terrain = noone;
				
				}else{
					component.incapacitated = true;		
				}
		
			break;
			
			
			case "WEB":
				component.incapacitated = true;
			
			break;
		
		}
		
		
	}else{
		component.incapacitated = false;	
		
	}
	
}