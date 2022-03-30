///@param = node
///@descrip returns a DS list containing all of the nodes directly adjacent (not diagonal!) to a node
function find_adjacent_nodes(argument0) {

	var homeNode = argument0 

	var gridX = homeNode.gridX;
	var gridY = homeNode.gridY;
 
	var adjNodes = ds_list_create();
	var node = noone;

	if (gridX > 0) {
		node = map[gridX - 1, gridY];
		ds_list_add(adjNodes, node); // add west node, if there is one
	}

	if (gridX < array_length_2d(map, 0) - 1) {
		node = map[gridX + 1, gridY]
		ds_list_add(adjNodes, node); // add east node, if there is one
	}

	if (gridY > 0) {
		node = map[gridX, gridY - 1];
		ds_list_add(adjNodes, node); // add north node, if there is one
	}

	if (gridY < array_height_2d(map) - 1) {
		 node = map[gridX, gridY + 1];
		ds_list_add(adjNodes, node); // add south node, if there is one
	}

	return adjNodes;

	


}
