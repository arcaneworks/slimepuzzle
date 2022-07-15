// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_terrain(component, node){
	var terrain = node.terrain;
	var infoStruct = component.componentStruct.info;
	if(terrain != noone){
		switch(terrain.terrainString){
		
			case "GROUND":
				component.disabled = false; 
				infoStruct.disabled = false;
			break;
			
			case "Ice":
				
					var tempNode = 	push_to_node(component.prevNode, node);
					component.moveToNode = tempNode; // set the target's push to node as that node
					component.moveState = "start path";
					component.shoved = true;	
				
			break;
			case "FIRE":
				if(component.class == "rock"){
					
					var tempStruct = snap_deep_copy(terrain.terrainStruct);
					copy_terrain_to_struct(terrain, tempStruct);
					ds_priority_add(terrain.undoList, tempStruct, global.totalMoves);
					terrain.dead = true;
					
					node.terrain = noone;	
				}
				 
			break;
			
			case "BONFIRE":
				if(component.class == "rock"){
					var tempStruct = snap_deep_copy(terrain.terrainStruct);
					copy_terrain_to_struct(terrain, tempStruct);
					ds_priority_add(terrain.undoList, tempStruct, global.totalMoves);
					terrain.dead = true;
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
						else {
							component.hp -= component.hp;
						
							ds_queue_enqueue(global.deathQueue, component);	
							component.deathWait = true;
							component.damaged = true;
							component.shake = true;
				
								
						}
						
					}else{
						component.hp -= component.hp;
						ds_queue_enqueue(global.deathQueue, component);	
						component.deathWait = true;
						component.damaged = true;
						component.shake = true;
						
					}
					
				}
				 
			break;
			
			case "HOLE":
				
			
				if(component.class == "rock"){
					var tempStruct = snap_deep_copy(terrain.terrainStruct);
					copy_terrain_to_struct(terrain, tempStruct);
					ds_priority_add(terrain.undoList, tempStruct, global.totalMoves);
					terrain.dead = true;
					
					ds_queue_enqueue(global.deathQueue, component);	
					component.deathWait = true;
					
					node.occupant = noone;
					node.terrain = noone;
				
				}else{
					component.disabled = true;		
				}
		
			break;
			
			
			case "WEB":
				component.disabled = true;
			
			break;
			
			case "SPIKE":
				
				if(component.triggersReaction){
					
						terrain.actState = "action standby";
						ds_list_add(terrain.targetList, component);
						ds_priority_add(global.actionQueue, terrain, 1000);

				}
			
			break;
		
		}
		
		
	}else{
		component.disabled = false;	
		
	}
	
}