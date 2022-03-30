// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_nodes_NEW(){
								


	
#region NODE CREATION AND NEIGHBOR POPULATION 

	// creates all the nodes that make up the map
	for(var xx = liveMapWidth - 1; xx >= 0; xx--){
		for(var yy = loadThresh - 1; yy >= 0; yy--){
			
			if (xx <= dataThresh && xx > loadThresh) { // for map positions in the 'partially loaded' zone
				
				map[xx, yy] = "temp";
			}
			
			if (xx < loadThresh) { // for map positions in the 'fully loaded' zone 
			
				// creates a node 
				var node = instance_create_layer(mapOrgX + xx * node_size, 
												 mapOrgY  - (yy * node_size) - node_size, 
												 "Instances", 
												 obj_node);
				map[xx, yy] = node;
				map[xx, yy].gridX = xx;
				map[xx, yy].gridY = yy;
				//if( yy >= liveMapHeight - 2){
			
				//	map[xx, yy].dark = false;
			
				//}
			}
	
		}
	}
	repopulate_neighbors()

	//populate node neighbor lists!
	for(var xx = 0; xx < liveMapWidth; xx += 1){
		for(var yy = 0; yy < loadThresh; yy += 1){
	
		node = map[xx, yy];
	
			//add left neighbor
			if(xx > 0){
				ds_list_add(node.neighbors, map[xx - 1, yy]);
			}
	
			//add right neighbor
			if(xx < liveMapWidth - 1){
				ds_list_add(node.neighbors, map[xx + 1, yy]);
			}
	
			//add top neighbor
			if(yy < loadThresh - 1){
				ds_list_add(node.neighbors, map[xx, yy + 1]);
			}
	
			//add bottom neighbor
			if(yy > 0){
				ds_list_add(node.neighbors, map[xx, yy - 1]);
			}
	
			//add top left neighbor
			if(xx > 0 && yy < loadThresh - 1){
				ds_list_add(node.neighbors, map[xx - 1, yy + 1]);
		
			}
	
			//add top right neighbor
			if(xx < liveMapWidth - 1 && yy < loadThresh - 1){
				ds_list_add(node.neighbors, map[xx + 1, yy + 1]);
		
			}
	
			//add bottom left neighbor
			if(xx > 0 && yy > 0){
				ds_list_add(node.neighbors, map[xx - 1, yy - 1]);
			}
	
			//add bottom right neighbor
			if(xx < liveMapWidth - 1 && yy > 0){
				ds_list_add(node.neighbors, map[xx + 1, yy - 1]);
			}
		}
	}
#endregion 
}