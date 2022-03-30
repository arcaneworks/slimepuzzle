// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function preload_CG(){ 
	// adds complete data for an entire, in string form, ready to be decoded later (once it reaches
	// the load threshhold) to flourish into a fully-formed node. This encoded string is saved
	// directly into the main map.
	
	// pluck random CG from active set
	var CGid = irandom_range(0, array_length(activeCGset) - 1); 
	var CG = activeCGset[CGid];
	
	// add encoded information for all rows, top to bottom and left to right
	for (var CGrow = CG.height - 1; 
			 CGrow >= 0; 
			 CGrow--) {
				 
		for (var col  = 0; col < map_width; col++) {
			var mapRow = topLoadedRow + CGrow + 1;
			map[col][mapRow] = CG.cellInfo[col][CGrow];
		
		}
	}
	
	topLoadedRow += CG.height; //
	
}