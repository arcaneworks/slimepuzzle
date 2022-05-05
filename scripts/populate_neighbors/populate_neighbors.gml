function populate_neighbors() {


			
	// re populate neighbor lists, bottom to top
	for(var xx = 0; xx < map_height; xx += 1){
		for(var yy = 0; yy < loadThresh; yy++) {
		var node = map[xx, yy];
		
		
	
			// WEST neighbor
			if(xx > 0){
				ds_list_add(node.neighbors, map[xx - 1, yy]);
			}
	
			//add EAST neighbor
			if(xx < map_width - 1){
				ds_list_add(node.neighbors, map[xx + 1, yy]);
			}
	
			//add N, NE, SW neighbors
			if(yy < loadThresh){ 
				
				//add NORTH neighbor
				ds_list_add(node.neighbors, map[xx, yy + 1]);
				
				//add NORTHWEST neighbor
				if(xx > 0){
					ds_list_add(node.neighbors, map[xx - 1, yy + 1]);	
				}
				//add NORTHEAST neighbor
				if(xx <  map_width - 1){
					ds_list_add(node.neighbors, map[xx + 1, yy + 1]);
				}
				
			}
				
			//add S, SE, SW neighbors
			if(yy > 0){
				ds_list_add(node.neighbors, map[xx, yy - 1]);
				
				if(xx > 0){
					ds_list_add(node.neighbors, map[xx - 1, yy - 1]);	
				}
				
				if(xx <  map_width - 1){
					ds_list_add(node.neighbors, map[xx + 1, yy - 1]);
				}
				
			}
			
		
	

		
		}


	}
}