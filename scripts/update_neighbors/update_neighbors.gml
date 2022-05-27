function update_neighbors() {
	//THIS FUNCTION ONLY RUNS AFTER THE CARAVAN ADVANCES
	//FOR INITIAL NEIGHBOR POPULATION OF THE MAP, SEE POPULATE_NEIGHBORS()

	//repopulates the neighbor lists of the bottom-most row, the top-most row, 
	//and the row one south of the topmost row. only the bottom-most needs clearing before neighbor population
	
	for(var xx = 0; xx < liveMapWidth; xx++){
	
		#region BOTTOM-MOST ROW REPOPULATE
	
			var yy = advanceNumber;	//current y position of bottom-most node row
			var node = map[xx, yy];
			
			ds_list_clear(node.neighbors); //clears neighborlist of that row
		
			if(xx > 0){ //adds WEST neighbor
				ds_list_add(node.neighbors, map[xx - 1, yy]);
			}
	
			//add EAST neighbor
			if(xx < liveMapWidth - 1){
				ds_list_add(node.neighbors, map[xx + 1, yy]);
			}
	
			//NORTHERN NODES
			if(yy < loadThresh){ 
				
				//add NORTH neighbor
				ds_list_add(node.neighbors, map[xx, yy + 1]);
				
				//add NORTHWEST neighbor
				if(xx > 0){
					ds_list_add(node.neighbors, map[xx - 1, yy + 1]);	
				}
				//add NORTHEAST neighbor
				if(xx < liveMapWidth - 1){
					ds_list_add(node.neighbors, map[xx + 1, yy + 1]);
				}
				
			}
	
			
	
			//add NORTHEAST neighbor
			if(xx < liveMapWidth - 1 && yy < loadThresh){
				ds_list_add(node.neighbors, map[xx + 1, yy + 1]);
		
			}
		#endregion 
	
	
		#region ROW SOUTH OF TOP-MOST ROW REPOPULATE 
	
			var yy = loadThresh -1;
			var node = map[xx, yy];
	
			//add NORTH neighbor
			ds_list_add(node.neighbors, map[xx, yy + 1]);
	
	
			//add NORTHWEST neighbor
			if(xx > 0){
				ds_list_add(node.neighbors, map[xx - 1, yy + 1]);
		
			}
	
			//add NORTHEAST neighbor
			if(xx < liveMapWidth - 1){
				ds_list_add(node.neighbors, map[xx + 1, yy + 1]);
		
			}
	
	
		#endregion
	
	
		#region TOP-MOST ROW REPOPULATE 
	
			var yy = loadThresh;
			var node = map[xx, yy];
			
			//adds SOUTH neighbor
			ds_list_add(node.neighbors, map[xx, yy - 1]); 
	
			if(xx > 0){ //adds WEST neighbor && SOUTHWEST neighbor
				ds_list_add(node.neighbors, map[xx - 1, yy]);
				ds_list_add(node.neighbors, map[xx - 1, yy - 1]);
			}
	
			//add EAST neighbor and SOUTHEAST neighbor
			if(xx < liveMapWidth - 1){
				ds_list_add(node.neighbors, map[xx + 1, yy]);
				ds_list_add(node.neighbors, map[xx + 1, yy - 1])
			}
		
		#endregion
	
	}
	
	#region REPOPULATE NEIGHBORS IN NODES ABOVE CARAVAN 
	
		var carX = global.caravan.gridX; //midle of the caravan
		var carInc = global.caravan.caravanInc; // distance on either side of middle of caravan 
	
		for (var xx = carX; xx < carX + carInc; xx++){
			var yy = advanceNumber + 1;
			
			var node = map[xx, yy];
			
			ds_list_clear(node.neighbors); 
			
			//add N, NE, NW neighbors
			if(yy < loadThresh){ 
				
				//add NORTH neighbor
				ds_list_add(node.neighbors, map[xx, yy + 1]);
				
				//add NORTHWEST neighbor
				if(xx > 0){
					ds_list_add(node.neighbors, map[xx - 1, yy + 1]);	
				}
				//add NORTHEAST neighbor
				if(xx < liveMapWidth - 1){
					ds_list_add(node.neighbors, map[xx + 1, yy + 1]);
				}
				
			}
				
		
			
	#endregion
		}			
	
}
