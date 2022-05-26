// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_terrain_editor(component, node){
	var terrain = node.terrain;
	
	if(terrain != noone){
		switch(terrain.terrainString){
		
			case "GROUND":
				component.disabled = false; 
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
							component.damageClass = "default";
							
						}
						else{
						component.hp -= component.hp;
						component.damaged = true;
						component.shake = true;
				
								
						}
						
					}
					
				}
				 
			break;
		
			case "HOLE":
				component.disabled = true;
			
				
			
				if(component.class == "rock"){
					ds_queue_enqueue(global.deathQueue, component);	
					component.deathWait = true;
					instance_destroy(terrain);
					node.occupant = noone;
					node.terrain = noone;
				
				}
		
			break;
			
			
			case "WEB":
				component.disabled = true;
			
			break;
		
		}
		
		
	}else{
		component.disabled = false;	
		
	}
	
}