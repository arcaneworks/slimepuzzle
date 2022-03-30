function set_node_occupancy() {

	with(obj_node){
				
	//#region CHANGES TERRAIN OBJECT INTO NODE.TERRAIN
		if(instance_position(x + 16, y + 16, obj_terrain)){  // if there is ANY kind of terrain at this node...
			var tempTerrain = instance_position(x + 16, y + 16, obj_terrain); 
			terrain = tempTerrain;
			terrain.gridX = gridX;
			terrain.gridY = gridY;
			terrainString = tempTerrain.terrainString;
			
		}
			
			
	// if there is an actor at this node, sets the node as occupied by that actor
		if(instance_position(x + (.5 * node_size), y + (.5 * node_size), obj_component)){ // if there is ANY actor at this node
			occupant = instance_position(x + (.5 * node_size), y + (.5 * node_size), obj_component);
			occupant.gridX = gridX;
			occupant.gridY = gridY;
			}
				
				
		if(instance_position(x + (.5 * node_size), y + (.5 * node_size), obj_effect)){ // if there is ANY actor at this node
			effect = instance_position(x + (.5 * node_size), y + (.5 * node_size), obj_effect);
			effect.gridX = gridX;
			effect.gridY = gridY;
			}
		}
		
	
	
	
}
