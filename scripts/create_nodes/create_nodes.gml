function create_nodes() {
	
#region NODE CREATION AND NEIGHBOR POPULATION 

	//create nodes

	// creates all the nodes that make up the map
	for(var xx = 0; xx < map_width; xx += 1){
		for(var yy = 0; yy < map_height; yy += 1){
		
			map[xx, yy] = instance_create_layer(mapOrgX + xx * node_size, mapOrgY + yy * node_size, "Instances", obj_node);
			// creates a node 
			map[xx, yy].gridX = xx;
			map[xx, yy].gridY = yy;

		}
	
	}



	//populate node neighbor lists!
	for(var xx = 0; xx < map_width; xx += 1){
		for(var yy = 0; yy < map_height; yy += 1){
	
		node = map[xx, yy];
	
			//add left neighbor
			if(xx > 0){
				ds_list_add(node.neighbors, map[xx - 1, yy]);
			}
	
			//add right neighbor
			if(xx < map_width - 1){
				ds_list_add(node.neighbors, map[xx + 1, yy]);
			}
	
			//add top neighbor
			if(yy > 0){
				ds_list_add(node.neighbors, map[xx, yy - 1]);
			}
	
			//add bottom neighbor
			if(yy < map_height - 1){
				ds_list_add(node.neighbors, map[xx, yy + 1]);
			}
	
			//add top left neighbor
			if(xx > 0 && yy > 0){
				ds_list_add(node.neighbors, map[xx - 1, yy - 1]);
		
			}
	
			//add top right neighbor
			if(xx < map_width - 1 && yy > 0){
				ds_list_add(node.neighbors, map[xx + 1, yy - 1]);
		
			}
	
			//add bottom left neighbor
			if(xx > 0 && yy < map_height - 1){
				ds_list_add(node.neighbors, map[xx - 1, yy + 1]);
			}
	
			//add bottom right neighbor
			if(xx < map_width - 1 && yy < map_height - 1){
				ds_list_add(node.neighbors, map[xx + 1, yy + 1]);
			}
		}
	}
#endregion 


}
