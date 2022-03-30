function set_node_occupancy_editor() {

	with(obj_node){
				
	//#region CHANGES TERRAIN OBJECT INTO NODE.TERRAIN
		if(instance_position(x + 16, y + 16, obj_bare_terrain)){  // if there is ANY kind of terrain at this node...
			var tempTerrain = instance_position(x + 16, y + 16, obj_bare_terrain); 
			terrain = tempTerrain;
			terrain.gridX = gridX;
			terrain.gridY = gridY;
			terrainString = tempTerrain.terrainString;
			
		}
			
			
	// if there is an actor at this node, sets the node as occupied by that actor
		if(instance_position(x + (.5 * node_size), y + (.5 * node_size), obj_bare_component)){ // if there is ANY actor at this node
			occupant = instance_position(x + (.5 * node_size), y + (.5 * node_size), obj_bare_component);
			occupant.gridX = gridX;
			occupant.gridY = gridY;
			}
				
				
		if(instance_position(x + (.5 * node_size), y + (.5 * node_size), obj_bare_element)){ // if there is ANY actor at this node
			effect = instance_position(x + (.5 * node_size), y + (.5 * node_size), obj_bare_element);
			effect.gridX = gridX;
			effect.gridY = gridY;
			}
		}
		
	
	
	
}
