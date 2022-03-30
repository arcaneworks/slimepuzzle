// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init_populate_map(){
	 
	
	var masterRowCt = 0; // the row currently being operated on  
	
	var CG = noone; // CG currently being loaded in
	var CGrow = 0; // the row OF THE CURRENT CG being operated on
	map[map_width - 1, map_height - 1] = noone;
		
	while (masterRowCt <= loadThresh) { // creates nodes and loads in all node info
										// up to the load threshold 
										// one CG at a time
										
		var CGid = irandom_range(0, array_length(activeCGset) - 1);
		CG = activeCGset[CGid];
		// randomly choose one CG in our active set
		
		// load in that CG from bottom to top
		for (var CGrow = CG.height - 1; 
			 CGrow >= 0; 
			 CGrow--) { // from bottom of CG to top
			for (var col = 0; col < map_width; col++) { // from left edge to right
				var dataStr = CG.cellInfo[col][CGrow]; // encoded string for one node
				 node = instance_create_layer(mapOrgX + col * node_size, 
												 mapOrgY - (masterRowCt + 1) * node_size, 
												 "Instances", 
												 obj_node);
				node.gridX = col; 
				node.gridY = masterRowCt;
				decode_node_info_new(dataStr, node); // decodes string, loads info into node
				map[col, masterRowCt] = node; // put that node in the map
				
			} // end of loading single node; go to next node
	
			masterRowCt++;
			// end of loading in CG row; move on to next row	
			
			if(masterRowCt > loadThresh) break;
		} // end of loading up to the load threshold 
			
	} // end of node creation + node info load
	
	
	// if the entire CG could not fit under the load threshold, we need to
	// load in the encoded info for the remaining rows just above the load threshold
	while (CGrow >= 0) {
		for (var col = 0; col < map_width; col++) { // from left edge to right
			var dataStr = CG.cellInfo[col][CGrow]; // encoded string for one node
			map[col, masterRowCt] = dataStr; // rreload that node 
		}
		CGrow--; 
		masterRowCt++;
	}
	
	var spaceUnderDataThresh = dataThresh - masterRowCt + 1; // amount of space left under 
														// data threshold 
												   
	while (spaceUnderDataThresh >= largestCG) { // while there is still space for ANY of our
												// CGs under the data threshold 
												// we preload another CG
		
		var CGid = irandom_range(0, array_length(activeCGset) - 1);
		CG = activeCGset[CGid];
		// generate random CG
		
		for (var CGrow = CG.height - 1; CGrow >= 0; CGrow--) { // from bottom of CG to top
			for (var col = 0; col < map_width; col++) { // from left edge to right
				var dataStr = CG.cellInfo[col][CGrow]; // encoded string for one node
				map[col, masterRowCt] = dataStr; // put that node in the map
				
			} // end of preloading single node; go to next node
	
			masterRowCt++;
			spaceUnderDataThresh--;
			// end of preloading in CG row; move on to next row
			
		} // end of loading up to the data threshold 
		
		
	} // end of preloading node info
		
	topLoadedRow = masterRowCt - 1;  // every row above this row contains no node data
	
	
	// populate remainder of map with placeholders
	while (masterRowCt < map_height) {
		for (var col = 0; col < map_width; col++) {
			map[col, masterRowCt] = "";
		}
		masterRowCt++;
	}
	
	

}