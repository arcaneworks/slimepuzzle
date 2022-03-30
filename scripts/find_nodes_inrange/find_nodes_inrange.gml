///@param node
///@param range
function find_nodes_inrange(argument0, argument1) {


	var node = argument0;
	var range = argument1;

	var startGridX = node.gridX; // grid x position of node
	var startGridY = node.gridY; // grid y position of node

	var targetNodes = ds_list_create();

	// we move from west to east-- first we color all nodes 
	// RANGE spaces to the left, then all of them RANGE - 1 spaces
	// to the left, and so on
	for (var xDiff = - range; xDiff <= range; xDiff++) {
	
		/* we move from south to north. we make sure that the absolute value
		// of the x distance from our starting node and the y distance of our starting
		// node is no greater than the range. So e.g. take a range 4 node at position (6,6).
		// (2, 6) is -4 in the x direction from our starting node and 0 in the y direction. |-4| + |0| = 4 <= 4.
		// (2, 6) is -4 in the x direction from our starting node and 0 in the y direction. |-4| + |0| = 4 <= 4.
		// (4, 7) is -2 in the x direction from our starting node and 1 in the y direction. |-2| + ]1| = 3 <= 4.
		*/
	
		for (var yDiff = -range + abs(xDiff); abs(yDiff) + abs(xDiff) <= range; yDiff++) {
		
			var xPos = startGridX + xDiff;
			var yPos = startGridY + yDiff;
		
			// ensure that we are in bounds of the map...
			if (xPos >= 0 && yPos >= 0 &&
				xPos < map_width && yPos < map_height) {
			
				ds_list_add(targetNodes,map[xPos,yPos]);	
		
			 }
		}
	}


	return targetNodes;
	ds_list_destroy(targetNodes);




}
